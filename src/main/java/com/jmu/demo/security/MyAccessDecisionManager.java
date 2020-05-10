//package com.jmu.demo.security;
//
//import org.springframework.security.access.AccessDecisionManager;
//import org.springframework.security.access.AccessDeniedException;
//import org.springframework.security.access.ConfigAttribute;
//import org.springframework.security.authentication.InsufficientAuthenticationException;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.stereotype.Service;
//
//import java.util.Collection;
//import java.util.Iterator;
//
//@Service
//public class MyAccessDecisionManager implements AccessDecisionManager {
//
//    /**
//     * decide 方法是判定是否拥有权限的决策方法
//     * .getHttpRequest();
//     * 此方法是为了判定用户请求的Url 是否在权限表中，如果在权限表中，则返回decide方法，用来判定用户是否由此权限，如果不在权限表中则放行
//     * @param authentication 是UserDetailsServiceImpl中循环添加到GrantedAuthority 对象中的权限信息集合
//     * @param o 包含客户端发起的请求的request信息，可转换为 HttpServletRequest request=((FilterInvocation) o)
//     * @param configAttributes 为MyInvocationSecurityMetadataSource的getAttributes(Object object)这个方法返回的结果，
//     * @throws AccessDeniedException
//     * @throws InsufficientAuthenticationException
//     */
//    @Override
//    public void decide(Authentication authentication, Object o, Collection<ConfigAttribute> configAttributes ) throws AccessDeniedException, InsufficientAuthenticationException {
//        if(null == configAttributes || configAttributes.size() <= 0) {
//            return;
//            //说明请求的系统中不存在指定的URL，返回执行security配置文件中其他项目。
//        }
//        ConfigAttribute c;
//        String needRole;
//        for(Iterator<ConfigAttribute> iter = configAttributes.iterator(); iter.hasNext(); ) {
//            c = iter.next();
//            needRole = c.getAttribute();
//            for(GrantedAuthority ga : authentication.getAuthorities()) {
//
//
//                if(needRole.trim().equals(ga.getAuthority())) {
//                    return;
//                }
//            }
//        }
//        throw new AccessDeniedException(" 没有权限访问！ ");
//    }
//
//    @Override
//    public boolean supports(ConfigAttribute configAttribute) {
//        return true;
//    }
//
//    @Override
//    public boolean supports(Class<?> aClass) {
//        return true;
//    }
//}
