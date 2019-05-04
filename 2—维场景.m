%�����ά����
I=double(imread('1.jpg'));
[m_I,n_I]=size(I);

%�������
v_t=30;
v=zeros(m_I,n_I);
scan_t=0:1.0e-7:4.0e-6;
scan_angle=pi/6:pi/60:5*pi/6;
delay_t=zeros(m_I,n_I);
distance=zeros(m_I,n_I);
A=zeros(m_I,n_I);
delay=zeros(1,41);
B=zeros(1,41);
A0=zeros(1:41);


%�������
for m=1:m_I
    for n=1:n_I
        format long;
        distance(m,n)=sqrt(double(m).*double(m)+double(n-(n_I+1)/2).*double(n-(n_I+1)/2));
    end
end

%���裺�Ҷ�ֵ����100�ĵ㸳����Ӧ���ٶ�30m/s
for m=1:m_I
    for n=1:n_I
        if I(m,n)>100
            v(m,n)=v_t;
        end
    end
end

%����ÿһ��ɨ�������õ��Ļز��źŵ�ʱ���ӳ٣�����Ӧ��ı仯�ķ��ȱ仯
%���裺�Ҷ�ֵ����225��Ĭ���ж�Ϊ�ϰ���ϰ���֮��ĵ㲻�ټ���ɨ��
%�ӳ�ʱ��=ɨ�赽�˽Ƕ�ʱ��ʱ��+2����������ٵ�ʱ��
for i=1:41
    for n=1:n_I
        for m=1:m_I
            if scan_angle(i)-atan((n-(n_I+1)/2)/m)<pi/180
               format long;
               delay_t(m,n)=double(2)*double(distance(m,n))/double(3.00000e8)+scan_t(i);
               A(m,n)=1*double(I(m,n));
               if I(m,n)>225
                  break;
               end
            end
        end
     end
end

%���ؼ�����Զ���ӳٺ͵��ε�ɨ�����֮�ͣ��ֱ�ΪB(1��i)��A0(1,i)
for i=1:41
    for n=1:n_I
        for m=1:m_I
            if scan_angle(i)-atan((n-(n_I+1)/2)/m)<pi/180
                format long
                A0(1,i)=A0(1,i)+A(m,n);
                if B(1,i)<delay_t(m,n)
                    B(1,i)=delay_t(m,n);
                end
            end
        end
    end
end
 










