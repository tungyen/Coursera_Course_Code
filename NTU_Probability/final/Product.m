function ans = Product(x)
    if (x==1 | x==0)
        ans = 1
    else
        ini = 1;
        for i=2:x
            ini = ini * i;
        end
        ans = ini;
    end

end