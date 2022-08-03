function X = solve_TMD(M,F,C,K,w)
    X = zeros(2,size(w,2));
    for iter = 1:size(w,2)
        X(:,iter) = abs((-w(iter).^2.*M+1i.*w(iter).*C+K)\F);
    end
end