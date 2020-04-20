package com.itheima.bos.web.interceptor;

import com.itheima.bos.entity.User;
import com.itheima.bos.utils.BOSUtils;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import org.apache.struts2.ServletActionContext;

/**
 *  自定义拦截器，实现用户未登录自动跳转登录页面
 */
public class BOSLoginInterceptor extends MethodFilterInterceptor {

    // 拦截方法
    @Override
    protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
        // 从session中获取对象，若有，则说明已经登录
        User user = BOSUtils.getLoginUser();
        if (user == null){
            return "login";
        }
        return actionInvocation.invoke();
    }
}
