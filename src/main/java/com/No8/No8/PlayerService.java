package com.No8.No8;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlayerService {
    private final PlayerMapper playerMapper;

    public PlayerService(PlayerMapper playerMapper) {
        this.playerMapper = playerMapper;
    }


    public List<Player> getPlayers() {

        List<Player> players = playerMapper.findAll();
        return players;

    }
}
