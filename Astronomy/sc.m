bvN=[00.0
0.13
0.27
0.42
0.58
0.70
0.89
1.18
1.45];
vN=[-0.7
2.0 
2.6 
3.4 
4.4 
5.1 
5.9 
7.3 
9.0];

bv=[
0.514
0.782
0.336
0.557
1.155
0.699
1.003
0.12    
0.995
0.353
0.539
0.017
1.326
1.346
0.686
0.125
0.843
0.87    
0.093];

v=[9.46  
11.337
8.581   
9.717   
13.481
10.536
12.066
7.395   
12.007
8.112   
9.904   
6.811   
12.541
13.743
10.929
6.953   
10.818
11.364
7.545   ];




n=length(bvN);
m=zeros(1,n-1);
mask=zeros(1,n-1);

disp('Calculando el polinomio interpolante...');
for i=1:n-1
    m(i) = (vN(i+1)-vN(i))/(bvN(i+1)-bvN(i));
end;

disp(m);

n=length(bv);
vR=zeros(1,n);
vRealArray=zeros(1,n-1);

for i=1:n-1
    j=1;
    while bvN(j)<bv(i)
        j++;
        if j>7 
            break;
        end;
    end;
    vReal = m(j-1)*(bv(i)-bvN(j))+vN(j)-v(i);
    vRealArray(i)=-vReal;

    disp(['y=', num2str(m(j-1)), '(x- ',num2str(bvN(j)), ')+',num2str(vN(j))]);

    disp(['Para bv=', num2str(bv(i)), ' el valor es ', num2str(-vReal)]);
end;

mMmean=mean(vRealArray);
err_mMmean=std(vRealArray);
disp(['The mean value for m-M is ', num2str(mMmean), ' and the standard deviation std(m-M) = ', num2str(err_mMmean)]);

# Measuring the distance according to the equation d=10*10^{(m-M)/5}

d = 10*10^(mMmean/5);
errd= d*log(10)/5*err_mMmean;
disp(['The distance is ', num2str(d), ' parsecs and the error is ', num2str(errd)]);