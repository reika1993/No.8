package com.No8.No8;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface PlayerMapper {


    @Select("SELECT * FROM players")
    List<Player> findAll();

    @Select("SELECT * FROM players WHERE name LIKE CONCAT(#{prefix}, '%')")
    List<Player> findByPlayerStartingWith(String prefix);
}






