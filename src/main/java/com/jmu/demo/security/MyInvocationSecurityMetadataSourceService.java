//package com.jmu.demo.security;
//
//import com.jmu.demo.entity.Permission;
//import com.jmu.demo.repository.PermissionRepository;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.access.ConfigAttribute;
//import org.springframework.security.access.SecurityConfig;
//import org.springframework.security.web.FilterInvocation;
//import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
//import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
//import org.springframework.stereotype.Service;
//
//import javax.servlet.http.HttpServletRequest;
//import java.util.*;
//
//@Service
//public class MyInvocationSecurityMetadataSourceService implements FilterInvocationSecurityMetadataSource {
//    @Autowired
//    private PermissionRepository permissionRepository;
//
//    private HashMap<String , Collection<ConfigAttribute>> map = null;
//
//
//    /**
//     * 系统启动后，首次有用户访问，加载权限表中所有权限。以便拦截无权放访问的用户请求。
//     *
//     * wzh增加了注释描述。
//     */
//    public void loadResourceDefine(){
//        map = new HashMap<>();
//        Collection<ConfigAttribute> array;
//        ConfigAttribute cfg;
//        List<Permission> permissions = permissionRepository.findAll();
//        for(Permission permission : permissions){
//            array = new ArrayList<>();
//            cfg = new SecurityConfig(permission.getName());
//            //此处只添加了权限的名字，其实还可以添加更多权限的信息，例如请求方法到ConfigAttribute的集合中去。
//            array.add(cfg);
//            //用权限的getUrl（）作为map的key，用ConfigAttribute的集合作为value
//            map.put(permission.getUrl(), array);
//        }
//    }
//
//
//    /**
//     * 此方法是为了判定用户请求的url是否再权限表中，如果在权限表中，则返回给decide方法，
//     * 用来判定用户是否有此权限。如果不在权限表中则放行。
//     *
//     * 方法的目的是：确定该请求是否需要进行访问权限的判断，对于需要判断权限的请求，返回resUrl，对于不需要
//     * 进行权限判断的请求，返回Null
//     */
//    @Override
//    public Collection<ConfigAttribute> getAttributes(Object o) throws IllegalArgumentException {
//        if(map == null){
//            loadResourceDefine();
//        }
//        HttpServletRequest request = ((FilterInvocation) o).getHttpRequest();
//        AntPathRequestMatcher matcher;
//        String resUrl;
//        for(Iterator<String> iter = map.keySet().iterator(); iter.hasNext(); ) {
//            resUrl = iter.next();
//            //当url里有？的时候  进行切割
//            if(resUrl.indexOf("?")>-1){
//                resUrl=resUrl.substring(0,resUrl.indexOf("?"));
//            }
//            matcher = new AntPathRequestMatcher(resUrl);
//            if(matcher.matches(request)) {
//                return map.get(resUrl);
//            }
//        }
//        return null;
//    }
//
//    @Override
//    public Collection<ConfigAttribute> getAllConfigAttributes() {
//        return null;
//    }
//
//    @Override
//    public boolean supports(Class<?> aClass) {
//        return true;
//    }
//}
