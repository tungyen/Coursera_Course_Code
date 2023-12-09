function theta456 = Calculate_up_pi(beta1, beta2, alpha1, alpha2, garmar1, garmar2)
    if beta1>180
        beta1 = beta1-360;
    end
    if beta2>180
        beta2 = beta2-360;
    end
    if alpha1>180
        alpha1 = alpha1-360;
    end
    if alpha2>180
        alpha2 = alpha2-360;
    end
    if garmar1>180
        garmar1 = garmar1-360;
    end
    if garmar2>180
        garmar2 = garmar2-360;
    end
    theta456 = [alpha1 beta1 garmar1 alpha2 beta2 garmar2];
end