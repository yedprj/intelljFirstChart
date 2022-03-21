package Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class controller {

    @RequestMapping(value = "/")
    public String test() {
        return "index";
    }

    @RequestMapping(value = "/api/apiTest")
    public String apiTest() {
        return "/api/apiTest";
    }

    @RequestMapping(value = "/api/apiTest2")
    public String apiTest2() {
        return "/api/apiTest2";
    }
}
