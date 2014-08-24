package kr.co.hitcom.rent.common;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReadyController {
    
    /** The Constant logger. */
    private static final Log logger = LogFactory.getLog(ReadyController.class);

    @RequestMapping(value = "/common/ready.do")
    public String loginAdmin()
        throws Exception {

        return "/common/common_ready";
    }

}
