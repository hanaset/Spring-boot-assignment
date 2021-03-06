package com.hanaset.luke.Interceptor;

import com.hanaset.luke.service.LukeAuthService;
import com.hanaset.luke.web.rest.exception.ErrorCode;
import com.hanaset.luke.web.rest.exception.LukeApiRestException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
@Component
public class AuthInterceptor implements HandlerInterceptor {

    private static final String HEADER_AUTH = "Authorization";
    private final LukeAuthService lukeAuthService;

    public AuthInterceptor(LukeAuthService lukeAuthService) {
        this.lukeAuthService = lukeAuthService;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        final String token = request.getHeader(HEADER_AUTH);

        if (token != null) {
            lukeAuthService.validAndParsingToken(token);
            return true;
        } else {
            throw new LukeApiRestException(ErrorCode.REQUEST_ERROR, "잘못된 요청입니다.");
        }
    }
}