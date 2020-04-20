package com.itheima.bos.web.action.base;

import com.itheima.bos.entity.Region;
import com.itheima.bos.utils.PageBean;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

/**
 *  表现层通用实现
 * @param <T>
 */
public class BaseAction<T> extends ActionSupport implements ModelDriven<T> {
    protected PageBean pageBean = new PageBean();
    DetachedCriteria criteria = null;
    public void setPage(int page) {
        pageBean.setCurrentPage(page);
    }

    public void setRows(int rows) {
        pageBean.setPageSize(rows);
    }

    /**
     *  java 转为 json
     * @param o
     * @param excludes
     */
    public void JavaToJson(Object o,String[] excludes){

        // 使用 json-lib 将 PageBean 对象转为 json ，通过输出流写回页面中
//        JSONObject 将单一对象转为json
//        JSONArray   将数组或者集合转为json
        JsonConfig config = new JsonConfig();
        // 指定哪些属性不需要转为json   new String[] {"currentPage","detachedCriteria","pageSize"}
        config.setExcludes(excludes);
        String json = JSONObject.fromObject(o,config).toString();
        ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
        try {
            ServletActionContext.getResponse().getWriter().print(json);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     *  java 转为 json
     * @param o
     * @param excludes
     */
    public void JavaToJson(List o, String[] excludes){

        // 使用 json-lib 将 PageBean 对象转为 json ，通过输出流写回页面中
//        JSONObject 将单一对象转为json
//        JSONArray   将数组或者集合转为json
        JsonConfig config = new JsonConfig();
        // 指定哪些属性不需要转为json   new String[] {"currentPage","detachedCriteria","pageSize"}
        config.setExcludes(excludes);
        String json = JSONArray.fromObject(o,config).toString();
        ServletActionContext.getResponse().setContentType("text/json;charset=utf-8");
        try {
            ServletActionContext.getResponse().getWriter().print(json);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static final String HOME = "home";
    public static final String LIST = "list";
    // 模型对象
    private T model;
    @Override
    public T getModel() {
        return model;
    }

    // 在构造方法中动态实体类型，通过反射创建 model 对象
    public BaseAction() {
        ParameterizedType genericSuperclass = (ParameterizedType) this.getClass().getGenericSuperclass();
        // 获取BaseAction上声明的泛型数组
        Type[] actualTypeArguments = genericSuperclass.getActualTypeArguments();
        Class<T> entityClass = (Class<T>) actualTypeArguments[0];

        criteria = DetachedCriteria.forClass(entityClass);
        pageBean.setDetachedCriteria(criteria);

            // 直接 newInstance() 已经过时
//            model = entityClass.newInstance();
        try {
            model = entityClass.getDeclaredConstructor().newInstance();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }

    }
}
