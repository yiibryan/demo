package com.demo.room;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/room")
public class RoomController {

    @ResponseBody
    @GetMapping("/list")
    public Map<String, Object> list() {
        Map<String, Object> json = new HashMap<>();
        json.put("key", "test 1");
        return json;
    }
}
