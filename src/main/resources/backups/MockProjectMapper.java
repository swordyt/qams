package backups;

import com.qams.domain.MockProject;

public interface MockProjectMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MockProject record);

    int insertSelective(MockProject record);

    MockProject selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MockProject record);

    int updateByPrimaryKey(MockProject record);
}