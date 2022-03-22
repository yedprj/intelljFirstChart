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

    @RequestMapping(value = "/api/chartTest")
    public String chartTest() {
        return "/api/chartTest";
    }

    @RequestMapping(value = "/api/apiChartTest")
    public String apiChartTest() {
        return "/api/apiChartTest";
    }
}
