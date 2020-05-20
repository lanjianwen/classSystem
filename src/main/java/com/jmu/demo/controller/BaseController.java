package com.jmu.demo.controller;

import com.jmu.demo.service.OperaRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class BaseController {


    @Autowired
    protected OperaRecordService operaRecordService;

    public HttpSession getSession(){
        ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attrs.getRequest();
        HttpSession session = request.getSession();
        return session;
    }

    public HttpServletRequest getRequest(){
        ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
       return attrs.getRequest();
    }

    public HttpServletResponse getResponse(){
        ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        return attrs.getResponse();
    }

    public void saveOperaRecord(String module, String name,  String belonging){
        String username = this.getRequest().getRemoteUser();
        this.operaRecordService.saveOperaRecord( module,  name,  username,  belonging,"");
    }


    public void saveOperaRecord(String module, String name,  String belonging,  String discription){
        String username = this.getRequest().getRemoteUser();
        this.operaRecordService.saveOperaRecord( module,  name,  username,  belonging,discription);
    }

}
