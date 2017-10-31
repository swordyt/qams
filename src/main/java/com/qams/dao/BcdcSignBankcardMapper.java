package com.qams.dao;

import com.qams.domain.BcdcSignBankcard;

public interface BcdcSignBankcardMapper {
    int deleteByPrimaryKey(String id);

    int insert(BcdcSignBankcard record);

    int insertSelective(BcdcSignBankcard record);

    BcdcSignBankcard selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(BcdcSignBankcard record);

    int updateByPrimaryKey(BcdcSignBankcard record);
}