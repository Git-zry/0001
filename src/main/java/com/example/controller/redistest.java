package com.example.controller;

import redis.clients.jedis.Jedis;

public class redistest {
 public static void main(String[] args) {
	 
	 Jedis jedis =new Jedis("localhost",6379);
     jedis.ping();
     jedis.set("A11", "a12");
     jedis.set("A11", "a13");
	 System.out.print(jedis.get("A11"));
	 
 }
}
