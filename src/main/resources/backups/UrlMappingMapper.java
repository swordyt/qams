package backups;

import com.qams.domain.UrlMapping;

public interface UrlMappingMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UrlMapping record);

    int insertSelective(UrlMapping record);

    UrlMapping selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UrlMapping record);

    int updateByPrimaryKey(UrlMapping record);
}