package backups;

import com.qams.domain.RoleUrlRelation;

public interface RoleUrlRelationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RoleUrlRelation record);

    int insertSelective(RoleUrlRelation record);

    RoleUrlRelation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RoleUrlRelation record);

    int updateByPrimaryKey(RoleUrlRelation record);
}