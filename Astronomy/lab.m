dataR=[1  4129.33 4165.67 15.6
1   4125    4162.17 15.8
1   4133.17 4171.67 15.49
1   4204.5  4242.83 16
1   4086.67 4123.67 14.10
1   4106.83 4143.17 14.40
1   4222.33 4259.83 16.30
1   4020    4055.67 12.5
4       4028.33 4063.16     12.9
6       4018.5  4057.83     12.5
7       4027    4062.67     12.9
15      4087.33 4123.33     14.10
16      4087    4122.5      14.10
17      4106.83 4143.17     14.40];
data = [
1 4018.50 4057.83 12.5
1 4020.00 4055.67 12.5
1 4027.00 4062.67 12.9
1 4028.33 4063.16 12.9
1 4086.67 4123.67 14.1
1 4087.33 4123.33 14.1
1 4087.00 4122.50 14.1
1 4106.83 4143.17 14.4
1 4106.83 4143.17 14.4
1 4133.17 4171.67 15.4
1 4129.33 4165.67 15.6
1 4125.00 4162.17 15.8
1 4204.50 4242.83 16.0    
1 4222.33 4259.83 16.3
    ];

# We calculate the difference lambda K and H
lambdaK=3933.7;        #A
lambdaH=3968.5;        #A
c=3e8;
M=-21;

n=length(data);
velocity=zeros(1,n);    # mean velocity km/s
evelocity=zeros(1,n);    # Error velocity
distance=zeros(1,n);    # Megaparsecs
hubble=zeros(1,n);
i=0;
for i=1:n
    velocity(i) = (c*(data(i,2)-lambdaK)/lambdaK+c*(data(i,3)-lambdaH)/lambdaH)/2/1000;
    evelocity(i) = abs(velocity(i)-c*(data(i,2)-lambdaK)/lambdaK/1000);

    distance(i) = (10**((data(i,4)-M)/5+1))/1e6;
    hubble(i)=velocity(i)/distance(i);
    disp([num2str(distance(i)),"\t",num2str(velocity(i)), "\t", num2str(evelocity(i)), "\t", num2str(velocity(i)/distance(i))]);
end;

hub=mean(hubble);
disp(["H = ",num2str(hub)]);