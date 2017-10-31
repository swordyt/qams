package com.qams.domain;

import java.util.Date;

public class BcdcSignBankcard {
    private String id;

    private String cardIdxNo;

    private String cardType;

    private String instId;

    private String instName;

    private String instCountryCode;

    private String instDistrictCode;

    private String instProvince;

    private String instCity;

    private String instBranch;

    private String cardName;

    private String certType;

    private String certNo;

    private String mobile;

    private Date createTime;

    private Date modifiedTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getCardIdxNo() {
        return cardIdxNo;
    }

    public void setCardIdxNo(String cardIdxNo) {
        this.cardIdxNo = cardIdxNo == null ? null : cardIdxNo.trim();
    }

    public String getCardType() {
        return cardType;
    }

    public void setCardType(String cardType) {
        this.cardType = cardType == null ? null : cardType.trim();
    }

    public String getInstId() {
        return instId;
    }

    public void setInstId(String instId) {
        this.instId = instId == null ? null : instId.trim();
    }

    public String getInstName() {
        return instName;
    }

    public void setInstName(String instName) {
        this.instName = instName == null ? null : instName.trim();
    }

    public String getInstCountryCode() {
        return instCountryCode;
    }

    public void setInstCountryCode(String instCountryCode) {
        this.instCountryCode = instCountryCode == null ? null : instCountryCode.trim();
    }

    public String getInstDistrictCode() {
        return instDistrictCode;
    }

    public void setInstDistrictCode(String instDistrictCode) {
        this.instDistrictCode = instDistrictCode == null ? null : instDistrictCode.trim();
    }

    public String getInstProvince() {
        return instProvince;
    }

    public void setInstProvince(String instProvince) {
        this.instProvince = instProvince == null ? null : instProvince.trim();
    }

    public String getInstCity() {
        return instCity;
    }

    public void setInstCity(String instCity) {
        this.instCity = instCity == null ? null : instCity.trim();
    }

    public String getInstBranch() {
        return instBranch;
    }

    public void setInstBranch(String instBranch) {
        this.instBranch = instBranch == null ? null : instBranch.trim();
    }

    public String getCardName() {
        return cardName;
    }

    public void setCardName(String cardName) {
        this.cardName = cardName == null ? null : cardName.trim();
    }

    public String getCertType() {
        return certType;
    }

    public void setCertType(String certType) {
        this.certType = certType == null ? null : certType.trim();
    }

    public String getCertNo() {
        return certNo;
    }

    public void setCertNo(String certNo) {
        this.certNo = certNo == null ? null : certNo.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(Date modifiedTime) {
        this.modifiedTime = modifiedTime;
    }
}