package com.example.hotel.mapper;

import org.apache.ibatis.annotations.Mapper;

//顾客-数据库接口
@Mapper
public interface UserMapper {
    int setRegister(String user_name,String user_pass,String phone,String idcard);
    //用户注册，返回是否注册成功

    //修改信息不知道要不要弄
}
