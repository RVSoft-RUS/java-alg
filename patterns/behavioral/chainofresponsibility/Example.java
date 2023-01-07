package chainofresponsibility;

import java.util.concurrent.ThreadLocalRandom;

/**
 * Каждый объект обработки в цепочке отвечает за определенный тип команды,
 * и по завершении обработки он пересылает команду следующему процессору в цепочке.
 */
public class Example {
    public static void main(String[] args) {
        HttpServletRequest httpServletRequest = new HttpServletRequest();

        RequestFilter exceededAttemptsFilter = new ExceededLoginAttemptsRequestFilter(null);

        RequestFilter unauthorizedFilter = new UnauthorizedRequestFilter(exceededAttemptsFilter);
        RequestFilter suspiciousActivityFilter = new SuspiciousRequestFilter(unauthorizedFilter);

        suspiciousActivityFilter.doFilter(httpServletRequest);
    }
}

abstract class RequestFilter {

    RequestFilter next;

    public RequestFilter(RequestFilter next) {
        this.next = next;
    }

    public abstract boolean doFilter(HttpServletRequest request);

    public RequestFilter getNext() { return this.next; }
}

class SuspiciousRequestFilter extends RequestFilter {

    public SuspiciousRequestFilter(RequestFilter next) {
        super(next);
    }

    public boolean doFilter(HttpServletRequest request) {
        System.out.println("in SuspiciousRequestFilter");
        if (hasMaliciousIntent()) {
            //blocks the request
            return false;
        } else if (next == null) {
            //filter chain ended
            return false;
        }
        return this.getNext().doFilter(request);
    }

    public boolean hasMaliciousIntent() {
        return ThreadLocalRandom.current().nextBoolean();
    }
}

class UnauthorizedRequestFilter extends RequestFilter {

    public UnauthorizedRequestFilter(RequestFilter next) {
        super(next);
    }

    public boolean doFilter(HttpServletRequest request) {
        System.out.println("in UnauthorizedRequestFilter");
        if(isUserUnauthorized(request)) {
            //blocks the request
            return false;
        } else if(next == null) {
            //filter chain ended
            return false;
        }
        return this.getNext().doFilter(request);
    }

    public boolean isUserUnauthorized(HttpServletRequest request) {
        return ThreadLocalRandom.current().nextBoolean();
    }
}

class ExceededLoginAttemptsRequestFilter extends RequestFilter {

    public ExceededLoginAttemptsRequestFilter(RequestFilter next) {
        super(next);
    }

    public boolean doFilter(HttpServletRequest request) {
        System.out.println("in ExceededLoginAttemptsRequestFilter");
        if(hasExceededLoginAttempts(request)) {
            //blocks the request
            return false;
        } else if(next == null) {
            //filter chain ended
            return false;
        }
        return this.getNext().doFilter(request);
    }

    public boolean hasExceededLoginAttempts(HttpServletRequest request) {
        return ThreadLocalRandom.current().nextBoolean();
    }
}



class HttpServletRequest {}
