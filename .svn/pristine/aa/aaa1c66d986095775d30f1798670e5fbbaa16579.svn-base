package com.itheima.bos.dao.impl;

import com.itheima.bos.dao.IRegionDao;
import com.itheima.bos.dao.base.impl.BaseDaoImpl;
import com.itheima.bos.entity.Region;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RegionDaoImpl extends BaseDaoImpl<Region> implements IRegionDao {
    /**
     *  根据q参数进行模糊查询
     * @param q
     * @return
     */
    @Override
    public List<Region> findListByQ(String q) {
        String hql = "from Region r where  r.citycode like '%"+q+"%' or r.city like '%"+q+"%' or r.district like '%"+q+"%' or r.province like '%"+q+"%' or r.shortcode like '%"+q+"%'";
        Session session = getSessionFactory().getCurrentSession();
        Query query = session.createQuery(hql);
        return query.list();
    }

//    @Override
//    public void saveBatch(List<Region> regionList) {
//        for (Region region:regionList){
//            this.getHibernateTemplate().save(region);
//        }
//    }
}
