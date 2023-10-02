package com.example.mastermind.controllers

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.http.MediaType
import org.springframework.test.web.servlet.MockMvc
import org.springframework.test.web.servlet.get

@SpringBootTest
@AutoConfigureMockMvc
class GameControllerTest {

    @Autowired
    lateinit var mockMvc: MockMvc

    @Test
    fun `should return a new game`() {
        mockMvc.get("/api/game/new")
            .andExpect {
                status { isOk() }
                content { contentType(MediaType.APPLICATION_JSON) }
//                jsonPath("$[0].game") { value("game") }
            }

    }
}
