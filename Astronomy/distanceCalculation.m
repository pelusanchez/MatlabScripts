# Coded by David Iglesias.
# Main sequence data for 10pc
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

# bv: m_b-m_v data array
bv=[];

# v: m_v data array
v=[];




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

    disp(['For bv=', num2str(bv(i)), ' the value is ', num2str(-vReal)]);
end;

mMmean=mean(vRealArray);
err_mMmean=std(vRealArray);
disp(['The mean value for m-M is ', num2str(mMmean), ' and the standard deviation std(m-M) = ', num2str(err_mMmean)]);

# Measuring the distance according to the equation d=10*10^{(m-M)/5}

d = 10*10^(mMmean/5);
errd= d*log(10)/5*err_mMmean;
disp(['The distance is ', num2str(d), ' parsecs and the error is ', num2str(errd)]);
