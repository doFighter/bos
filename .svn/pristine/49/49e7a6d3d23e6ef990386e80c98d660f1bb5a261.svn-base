package com.itheima.bos.web.action;

import com.itheima.bos.entity.Region;
import com.itheima.bos.service.IRegionService;
import com.itheima.bos.utils.PageBean;
import com.itheima.bos.utils.PinYin4jUtils;
import com.itheima.bos.web.action.base.BaseAction;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *  区域管理
 */
@Controller
@Scope("prototype")
public class RegionAction extends BaseAction<Region> {

    // 属性驱动，接收上传的文件
    private File regionFile;

    @Autowired
    private IRegionService regionService;

    public void setRegionFile(File regionFile) {
        this.regionFile = regionFile;
    }

    /**
     *  区域导入
     * @return
     */
    public String importXls() throws IOException {
        List<Region> regionList = new ArrayList<>();
//        System.out.println(regionFile);
        // 使用 POI　解析　ｅｘｃｌｅ
        HSSFWorkbook hssfWorkbook = new HSSFWorkbook(new FileInputStream(regionFile));
        // 根据名称获得指定的 Sheet 对象
        HSSFSheet hssfSheet = hssfWorkbook.getSheet("Sheet1");
        for (Row row:hssfSheet){
            int rowNum = row.getRowNum();
            if (rowNum == 0 ){
                continue;
            }
            String id = row.getCell(0).getStringCellValue();
            String province = row.getCell(1).getStringCellValue();
            String city = row.getCell(2).getStringCellValue();
            String district = row.getCell(3).getStringCellValue();
            String postcode = row.getCell(4).getStringCellValue();
            Region region = new Region(id,province,city,district,postcode,null,null,null);

            province = province.substring(0,province.length()-1);
            city = city.substring(0,city.length()-1);
            district = district.substring(0,district.length()-1);
            String unit = province+city+district;
            String[] headCode = PinYin4jUtils.getHeadByString(unit);
            String shortCode = StringUtils.join(headCode);
            region.setShortcode(shortCode);

            String cityCode = PinYin4jUtils.hanziToPinyin(city,"");
            region.setCitycode(cityCode);

            regionList.add(region);
        }
        regionService.saveBatch(regionList);
        return NONE;
    }



    /**
     *  分页查询
     * @return
     */
    public String pageQuery() throws IOException {

        regionService.pageQury(pageBean);
        // 在 Subarea 有了数据之后，就会出现死循环，是因为 Region与Subarea是相互引用，为了解决这个问题，我们在转json时应该把相互引用的部分排除
        this.JavaToJson(pageBean,new String[] {"currentPage","detachedCriteria","pageSize","subareas"});
        return NONE;
    }

    private String q;

    public String getQ() {
        return q;
    }

    public void setQ(String q) {
        this.q = q;
    }

    /**
     *  查询所有数据，写回json数据
     * @return
     */
    public String listAjax(){
        List<Region> regionList = null;//regionService.findAll();
        if (StringUtils.isNotBlank(q)){
            regionList = regionService.findListByQ(q);
        }else {
            regionList = regionService.findAll();
        }
        this.JavaToJson(regionList,new String[]{"subareas"});
        return NONE;
    }
}
