package com.No8.No8;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface PlayerMapper {
    @Select("SELECT * FROM players")
    List<Player> findAll();


}

