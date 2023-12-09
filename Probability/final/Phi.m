function fi = Phi(z)
    func = @(x) exp(-0.5*(x.^2))/sqrt(2*pi);
    fi = integral(func, -Inf, z);
end
