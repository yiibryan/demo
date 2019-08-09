package com.common.util;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.Proxy;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.GZIPInputStream;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

/**
 * 网络连接工具类
 * 
 * @author liming
 * @date 2015年10月7日下午5:21:35
 */
public class Spider
{

	public static Charset UTF8 = Charset.forName("UTF-8");
	public static Charset GB2312 = Charset.forName("GB2312");
	public static Charset GBK = Charset.forName("GBK");
	public static Charset ISO88591 = Charset.forName("ISO-8859-1");

	public enum Method
	{
		PUT, DELETE, POST, GET
	}

	public interface CodeErrorHandler
	{
		Response handler(Response response, int code, Map<String, List<String>> headers);
	}

	protected Proxy proxy = null;
	protected String proxyAuth = null;
	protected int tlt = 5;
	protected int connTimeout = 3000000;
	protected int readTimeout = 3000000;
	protected Map<String, String> headers = new HashMap<String, String>();
	protected CodeErrorHandler codeErrorHandler = null;
	protected boolean debug = false;

	public static String urlencode(Map<String, ?> data, String charset)
			throws UnsupportedEncodingException
	{
		StringBuilder sb = new StringBuilder();
		for (Map.Entry<String, ?> i : data.entrySet())
		{
			sb.append(URLEncoder.encode(i.getKey(), charset))
					.append("=")
					.append(URLEncoder.encode(i.getValue().toString(), charset))
					.append("&");
		}
		return sb.toString();
	}

	public Response raw(Method method, String url, byte[] post)
			throws Exception
	{
		Response resp = new Response(method, url, post, 0).doRequest();
		while (resp == null || resp.body == null)
		{
			if(resp!=null){
				resp = resp.doRequest();
			}
		}
		return resp;
	}

	public Response put(String url, byte[] post) throws Exception
	{
		return raw(Method.PUT, url, post);
	}

	public Response delete(String url, byte[] post) throws Exception
	{
		return raw(Method.DELETE, url, post);
	}

	public Response post(String url, byte[] post) throws Exception
	{
		return raw(Method.POST, url, post);
	}

	public Response get(String url) throws Exception
	{
		return raw(Method.GET, url, null);
	}
	
	public static String doRequest(String url) throws Exception {
        Spider s = new Spider();
        String body = s.get(url).getBody(UTF8);
        
        return body;
    }

    public static String doRequest(String url,Map<String,Object> params) throws Exception {
//        String date = DateUtil.getCurDateStr("yyyy-MM-dd mm:hh:ss");
//        params.put("app_key","car");
//        params.put("client_type","android");
//        params.put("sign_method", "md5");
//        params.put("timestamp",date);
//        params.put("format","json");
//        params.put("ver","2.4.1");
//        if(Constants.SYS_USER!=null){
//            params.put("customerId",Constants.SYS_USER.id);
//            params.put("user_token",Constants.SYS_USER.userToken); 
//        }
        
//        String sign = Constants.buildSign(params);
//        params.put("sign",sign);
        
        StringBuilder sb = new StringBuilder();
        int index=0;
        for(Map.Entry<String, Object> entry:params.entrySet()){
            if(index==0){
                sb.append(entry.getKey()+"="+entry.getValue());
                index++;
            }else{
                sb.append("&"+entry.getKey()+"="+entry.getValue());
            }
        }
        
        Spider s = new Spider();
        String body = s.post(url,sb.toString().getBytes(UTF8)).getBody(UTF8);

        return body;
    }

	public class Response
	{
		private Method method;
		private String url;
		private byte[] post;
		private int tts;

		private Map<String, List<String>> header = null;
		private byte[] body = null;

		public Response(Method method, String url, byte[] post, int tts)
		{
			this.method = method;
			this.url = url;
			this.post = post;
			this.tts = tts;
		}

		private class TrustAnyTrustManager implements X509TrustManager
		{
			public void checkClientTrusted(X509Certificate[] chain,
					String authType) throws CertificateException
			{
			}

			public void checkServerTrusted(X509Certificate[] chain,
					String authType) throws CertificateException
			{
			}

			public X509Certificate[] getAcceptedIssuers()
			{
				return new X509Certificate[] {};
			}
		}

		private class TrustAnyHostnameVerifier implements HostnameVerifier
		{
			public boolean verify(String hostname, SSLSession session)
			{
				return true;
			}
		}

		public Response doRequest() throws Exception
		{
			if (++tts > Spider.this.tlt)
			{
				throw new IOException("try limit>>" + Spider.this.tlt
						+ "<<\r\n" + url);
			}

			URL urlObj = new URL(url);

			HttpURLConnection conn = null;
			try
			{
				if (proxy != null)
				{
					conn = (HttpURLConnection) urlObj.openConnection(proxy);
				}
				else
				{
					conn = (HttpURLConnection) urlObj.openConnection();
				}
				if (url.startsWith("https"))
				{
					SSLContext ctx = SSLContext.getInstance("SSL");
					ctx.init(null, new TrustManager[]
					{ new TrustAnyTrustManager() },
							new java.security.SecureRandom());
					((HttpsURLConnection) conn).setSSLSocketFactory(ctx
							.getSocketFactory());
					((HttpsURLConnection) conn)
							.setHostnameVerifier(new TrustAnyHostnameVerifier());
				}

				if (headers != null)
				{
					for (Map.Entry<String, String> i : headers.entrySet())
					{
						conn.setRequestProperty(i.getKey(), i.getValue());
					}
				}
				if (Spider.this.proxyAuth != null)
				{
					conn.setRequestProperty("Proxy-Authorization",
							Spider.this.proxyAuth);
				}

				conn.setConnectTimeout(connTimeout);
				conn.setReadTimeout(readTimeout);
				if (Spider.this.codeErrorHandler == null)
				{
					conn.setInstanceFollowRedirects(Spider.this.codeErrorHandler == null);
				}

				conn.setRequestMethod(method.toString());
				if (method != Method.GET)
				{
					conn.setDoOutput(true);
				}

				conn.connect();

				if (method != Method.GET && post != null)
				{
					try (DataOutputStream out = new DataOutputStream(
							conn.getOutputStream()))
					{
						out.write(post);
					}
				}

				header = conn.getHeaderFields();
				if (debug)
				{
					StringBuilder sb = new StringBuilder("[").append(url)
							.append("]\r\n");
					ArrayList<String> keys = new ArrayList<String>(
							header.keySet());
					Collections.sort(keys, new Comparator<String>()
					{
						@Override
						public int compare(String o1, String o2)
						{
							if (o1 == null)
							{
								return -1;
							}
							if (o2 == null)
							{
								return 1;
							}
							return o1.length() - o2.length();
						}
					});
					for (String string : keys)
					{
						sb.append(string).append("\t=======>")
								.append(header.get(string)).append("\r\n");
					}
					System.out.println(sb.toString());
				}

				int code = conn.getResponseCode();
				if (code == 200 | code == 201)
				{
					try (InputStream is = conn.getInputStream())
					{
						ByteArrayOutputStream baos = new ByteArrayOutputStream();
						int bufSz = 1024;
						byte[] b = new byte[bufSz];
						int n = 0;

						String encoding = conn.getContentEncoding();
						if (encoding != null
								&& encoding.equalsIgnoreCase("gzip"))
						{
							try (GZIPInputStream gis = new GZIPInputStream(is))
							{
								while ((n = gis.read(b, 0, bufSz)) > 0)
								{
									baos.write(b, 0, n);
								}
							}
						}
						else
						{
							while ((n = is.read(b, 0, bufSz)) > 0)
							{
								baos.write(b, 0, n);
							}
						}
						this.body = baos.toByteArray();
						baos.close();
					}
					return this;
				}

				if (codeErrorHandler != null)
				{
					return codeErrorHandler.handler(this, code,
							conn.getHeaderFields());
				}

				throw new IOException("ResponseCode>>" + code + "<<\r\n" + url);
			}
			catch (Exception e)
			{
				throw e;
			}
			finally
			{
				if (conn != null)
				{
					conn.disconnect();
				}
			}
		}

		public Method getMethod()
		{
			return method;
		}

		public void setMethod(Method method)
		{
			this.method = method;
		}

		public String getUrl()
		{
			return url;
		}

		public void setUrl(String url)
		{
			this.url = url;
		}

		public byte[] getPost()
		{
			return post;
		}

		public void setPost(byte[] post)
		{
			this.post = post;
		}

		public int getTts()
		{
			return tts;
		}

		public void setTts(int tts)
		{
			this.tts = tts;
		}

		public byte[] getBody()
		{
			return body;
		}

		public String getBody(Charset charset)
		{
			return new String(body, charset);
		}

		public Map<String, List<String>> getHeader()
		{
			return header;
		}

		public void setBody(byte[] body)
		{
			this.body = body;
		}

		public void setHeader(Map<String, List<String>> header)
		{
			this.header = header;
		}
	}

	public Proxy getProxy()
	{
		return proxy;
	}

	public String getProxyAuth()
	{
		return proxyAuth;
	}

	public int getTlt()
	{
		return tlt;
	}

	public int getConnTimeout()
	{
		return connTimeout;
	}

	public int getReadTimeout()
	{
		return readTimeout;
	}

	public Map<String, String> getHeaders()
	{
		return headers;
	}

	public CodeErrorHandler getCodeErrorHandler()
	{
		return codeErrorHandler;
	}

	public boolean isDebug()
	{
		return debug;
	}

	public Spider setProxy(Proxy proxy)
	{
		this.proxy = proxy;
		return this;
	}

	public Spider setProxyAuth(String proxyAuth)
	{
		this.proxyAuth = proxyAuth;
		return this;
	}

	public Spider setTlt(int tlt)
	{
		this.tlt = tlt;
		return this;
	}

	public Spider setConnTimeout(int connTimeout)
	{
		this.connTimeout = connTimeout;
		return this;
	}

	public Spider setReadTimeout(int readTimeout)
	{
		this.readTimeout = readTimeout;
		return this;
	}

	public Spider setHeaders(Map<String, String> headers)
	{
		this.headers = headers;
		return this;
	}

	public Spider setCodeErrorHandler(CodeErrorHandler codeErrorHandler)
	{
		this.codeErrorHandler = codeErrorHandler;
		return this;
	}

	public Spider setDebug(boolean debug)
	{
		this.debug = debug;
		return this;
	}
}
