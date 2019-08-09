package com.common.conf.transactional;

import org.aspectj.lang.annotation.Aspect;
import org.springframework.aop.Advisor;
import org.springframework.aop.aspectj.AspectJExpressionPointcut;
import org.springframework.aop.support.DefaultPointcutAdvisor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.interceptor.*;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.*;

//@Aspect
//@Configuration
public class TransactionalConfig {
    private static final int TX_METHOD_TIMEOUT=5;

//    private static final String AOP_POINTCUT_EXPRESSION = "execution (* com.gjbigdata..service.impl.*.*(..))";
    private static final String AOP_POINTCUT_EXPRESSION = "execution (* com.gjbigdata.realtysale.crm.money.service.impl.MoneyServiceImpl.*(..))";

    @Resource(name = "txManager1")
    private PlatformTransactionManager transactionManager;

    @Bean(name = "txManager1")
    public PlatformTransactionManager platformTransactionManager(DataSource source){
        DataSourceTransactionManager dataSourceTransactionManager = new DataSourceTransactionManager();
        dataSourceTransactionManager.setDataSource(source);
        return dataSourceTransactionManager;
    }

    @Bean
    public TransactionInterceptor txAdvice() {

         /*事务管理规则，声明具备事务管理的方法名*/
        NameMatchTransactionAttributeSource source=new NameMatchTransactionAttributeSource();
        /*只读事物、不做更新删除等*/
        /*当前存在事务就用当前的事务，当前不存在事务就创建一个新的事务*/
        RuleBasedTransactionAttribute readOnlyRule=new RuleBasedTransactionAttribute();
        /*设置当前事务是否为只读事务，true为只读*/
        readOnlyRule.setReadOnly(true);
        /* transactiondefinition 定义事务的隔离级别；
         * PROPAGATION_NOT_SUPPORTED事务传播级别5，以非事务运行，如果当前存在事务，则把当前事务挂起*/
        readOnlyRule.setPropagationBehavior(TransactionDefinition.PROPAGATION_NOT_SUPPORTED);

        //事务配置
        RuleBasedTransactionAttribute requireRule=new RuleBasedTransactionAttribute();
        /*抛出异常后执行切点回滚*/
        List<RollbackRuleAttribute> ruleAttributes = new ArrayList<RollbackRuleAttribute>(){{
            add(new RollbackRuleAttribute(Exception.class));
            add(new RollbackRuleAttribute(RuntimeException.class));
        }};
        requireRule.setRollbackRules(ruleAttributes);
        /*PROPAGATION_REQUIRED:事务隔离性为1，若当前存在事务，则加入该事务；如果当前没有事务，则创建一个新的事务。这是默认值。 */
        requireRule.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        /*设置事务失效时间，如果超过5秒，则回滚事务*/
//        requireRule.setTimeout(TX_METHOD_TIMEOUT);

        Map<String,TransactionAttribute> txMap=new HashMap<>();

        txMap.put("add*",requireRule);
        txMap.put("save*", requireRule);
        txMap.put("insert*",requireRule);
        txMap.put("update*",requireRule);
        txMap.put("delete*",requireRule);
        txMap.put("remove*",requireRule);
        txMap.put("get*",readOnlyRule);
        txMap.put("query*", readOnlyRule);
        txMap.put("find*", readOnlyRule);
        txMap.put("select*",readOnlyRule);
        source.setNameMap(txMap);
        TransactionInterceptor txAdvice=new TransactionInterceptor(transactionManager, source);
        return txAdvice;
    }

    @Bean
    public Advisor txAdviceAdvisor() {
        AspectJExpressionPointcut pointcut = new AspectJExpressionPointcut();
        pointcut.setExpression(AOP_POINTCUT_EXPRESSION);
        return new DefaultPointcutAdvisor(pointcut, txAdvice());
    }
}
