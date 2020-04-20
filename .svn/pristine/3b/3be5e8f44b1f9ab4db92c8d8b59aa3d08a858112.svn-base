package com.itheima.bos.web.action;

import com.itheima.bos.entity.Region;
import com.itheima.bos.entity.Subarea;
import com.itheima.bos.service.ISubareaService;
import com.itheima.bos.utils.FileUtils;
import com.itheima.bos.web.action.base.BaseAction;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.ServletOutputStream;
import java.io.IOException;
import java.util.List;

@Controller
@Scope("prototype")
public class SubareaAction extends BaseAction<Subarea> {

    @Autowired
    private ISubareaService subareaService;
    /**
     *  添加分区
     */
    public String add(){
        subareaService.save(getModel());
        return LIST;
    }

    /**
     *  分页查询
     * @return
     */
    public String pageQuery(){
        DetachedCriteria criteria = pageBean.getDetachedCriteria();
        // 添加动态查询条件
        String addresskey = getModel().getAddresskey();
        if (StringUtils.isNotBlank(addresskey)){
            // 添加过滤条件，根据关键字模糊查询
            criteria.add(Restrictions.like("addresskey","%"+addresskey+"%"));
        }
        Region region = getModel().getRegion();
        if (region != null){
            String province = region.getProvince();
            String city = region.getCity();
            String district = region.getDistrict();
            // 添加过滤条件，根据省份模糊查询========》需要连接 region表,使用别名方式实现
            // 参数一：分区对象中关联的区域对象的名称
            // 参数二：任意
            criteria.createAlias("region","r");
            if (StringUtils.isNotBlank(province)){
                // 添加过滤条件，根据省份模糊查询========》需要连接 region表,使用别名方式实现

                criteria.add(Restrictions.like("r.province","%"+province+"%"));
            }
            if (StringUtils.isNotBlank(city)){
                // 添加过滤条件，根据市模糊查询========》需要连接 region表

                criteria.add(Restrictions.like("r.city","%"+city+"%"));
            }
            if (StringUtils.isNotBlank(district)){
                // 添加过滤条件，根据区模糊查询========》需要连接 region表

                criteria.add(Restrictions.like("r.district","%"+district+"%"));
            }
        }
        subareaService.pageQuery(pageBean);
        this.JavaToJson(pageBean,new String[]{"currentPage","detachedCriteria","pageSize","decidedzone","subareas"});
        return NONE;
    }

    /**
     *  分区数据导出功能
     * @return
     */
    public String exportXls() throws IOException {
        //  查询所有的分区数据
        List<Subarea> subareas = subareaService.findAll();
        // 使用POI将数据写入到 excle中
        // 在内存中创建一个 excle 文件
        HSSFWorkbook hssfWorkbook = new HSSFWorkbook();
        // 创建一个标签页
        HSSFSheet sheet = hssfWorkbook.createSheet("分区数据");
        // 创建标题行
        HSSFRow headRow = sheet.createRow(0);
        headRow.createCell(0).setCellValue("分区编号");
        headRow.createCell(1).setCellValue("开始编号");
        headRow.createCell(2).setCellValue("结束编号");
        headRow.createCell(3).setCellValue("位置信息");
        headRow.createCell(4).setCellValue("省市区");

        for (Subarea subarea:subareas){
            HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum()+1);
            dataRow.createCell(0).setCellValue(subarea.getId());
            dataRow.createCell(1).setCellValue(subarea.getStartnum());
            dataRow.createCell(2).setCellValue(subarea.getEndnum());
            dataRow.createCell(3).setCellValue(subarea.getPosition());
            dataRow.createCell(4).setCellValue(subarea.getRegion().getName());
        }

        // 使用输出流进行文件下载( 一个流，两个头)
        String filename = "分区数据.xls";
        String fileType = ServletActionContext.getServletContext().getMimeType(filename);
        ServletOutputStream outputStream = ServletActionContext.getResponse().getOutputStream();
        ServletActionContext.getResponse().setContentType(fileType);

        // 获取客户端浏览器类型
        String agent = ServletActionContext.getRequest().getHeader("User-Agent");
        filename = FileUtils.encodeDownloadFilename(filename,agent);

        ServletActionContext.getResponse().setHeader("content-disposition","attachment;filename="+filename);
        hssfWorkbook.write(outputStream);
        return NONE;
    }

    /**
     *  查询所有未关联定区的分区，返回 json数据
     * @return
     */
    public String listAjax(){
        List<Subarea> subareas = subareaService.findListNotAssociation();
        this.JavaToJson(subareas,new String[]{"decidedzone","region"});
        return NONE;
    }

    // 属性驱动，接收定区id
    private String decidedzoneId;

    public String getDecidedzoneId() {
        return decidedzoneId;
    }

    public void setDecidedzoneId(String decidedzoneId) {
        this.decidedzoneId = decidedzoneId;
    }

    /**
     *  根据定区的id查询关联的分区
     * @return
     */
    public String findListByDecidedzoneId(){
        List<Subarea> subareas = subareaService.findListByDecidedzoneId(decidedzoneId);
        System.out.println(subareas);
        this.JavaToJson(subareas,new String[]{"decidedzone","subareas"});
        return NONE;
    }

    /**
     *  查询区域分区分布图数据
     * @return
     */
    public String findSubareasGroupByProvince(){
        List<Object> list = subareaService.findSubareasGroupByProvince();
        this.JavaToJson(list,new String[]{});
        return NONE;
    }
}
