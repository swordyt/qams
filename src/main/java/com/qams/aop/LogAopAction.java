package com.qams.aop;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.alibaba.fastjson.JSONObject;
import com.qams.util.NetworkUtil;

@Aspect
public class LogAopAction {
	private static final Logger Log = Logger.getLogger(LogAopAction.class);

	// Controller切入点
	@Pointcut("execution(* com.qams.controller..*.*(..))")
	private void controllerAspect() {
	}

	// Service切入点
	@Pointcut("execution(* com.qams.service..*.*(..))")
	private void serviceAspect() {
	}

	@Around("controllerAspect()")
	public Object controllerAround(ProceedingJoinPoint pjp) throws Throwable {
		Log.info("======Controller start======");
		recodeLog(pjp);
		Object obj = pjp.proceed();
		Log.info("return=" + obj.getClass().getName());
		Log.info("======Controller end======");
		return obj;
	}

	@Around("serviceAspect()")
	public Object serviceAround(ProceedingJoinPoint pjp) throws Throwable {
		Log.info("======Service start======");
		recodeLog(pjp);
		Object obj = pjp.proceed();
		Log.info("return=" + JSONObject.toJSONString(obj));
		Log.info("======Service end======");
		return obj;
	}

	private void recodeLog(ProceedingJoinPoint pjp) throws IOException {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes()).getRequest();
		Log.info("userid=" + request.getAttribute("userid"));
		Object obj = pjp.getTarget();
		Log.info("Class=" + obj.getClass().getName());
		Signature sig = pjp.getSignature();
		String methodName = sig.getName();
		Log.info("method=" + methodName);
		MethodSignature msig = (MethodSignature) sig;
		Class[] parameterTypes = msig.getMethod().getParameterTypes();
		Log.info("parameterType=" + JSONObject.toJSONString(parameterTypes));
		// Object[] args = pjp.getArgs();
		// Log.debug("parameter=" + JSONObject.toJSONString(args));
	}
}
