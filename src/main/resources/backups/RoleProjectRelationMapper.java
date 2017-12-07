package backups;

import com.qams.domain.RoleProjectRelation;

public interface RoleProjectRelationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RoleProjectRelation record);

    int insertSelective(RoleProjectRelation record);

    RoleProjectRelation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RoleProjectRelation record);

    int updateByPrimaryKey(RoleProjectRelation record);
}