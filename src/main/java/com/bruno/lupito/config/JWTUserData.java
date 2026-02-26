package com.bruno.lupito.config;

import lombok.Builder;

@Builder
public record JWTUserData(Long userId, String email) {


}
