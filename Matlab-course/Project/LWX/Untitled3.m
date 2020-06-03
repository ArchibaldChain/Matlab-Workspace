
%rKey={[4],[3 3],[1 1 1],[1 3 1],[1 1 1],[1 1],[1 1],[1 1 1],[1 1 1],[1 1 1],[1 1],[8]};
%cKey={[11],[1 1],[2 1 1],[1 3 1],[1 1 3 1],[2 1],[1 1],[11]};
m=length(rKey);
n=length(cKey);
A=zeros(m,n);
Ai=zeros(1,n);
B=zeros(m,n);
for i1=1:m
saverow{i1}={};
end
for i2=1:n
savecolumn{i2}={};
end
saveR={};
saveC={};
for i=1:m
saverow{i}=generation_row(n,rKey{i});
end
for i=1:n
savecolumn{i}=generation_column(m,cKey{i});
end

toge={};
    for ii1=1:length(saverow{1})
    A(1,:)=saverow{1}{ii1};
        for ii2=1:length(saverow{2})
            A(2,:)=saverow{2}{ii2};
        for ii3=1:length(saverow{3})
            A(3,:)=saverow{3}{ii3};
        if m>3 
        for ii4=1:length(saverow{4})
        A(4,:)=saverow{4}{ii4};
            if m>4
            for ii5=1:length(saverow{5})
            A(5,:)=saverow{5}{ii5};
              if m>5
              for ii6=1:length(saverow{6})
              A(6,:)=saverow{6}{ii6};   
                if m>6
                for ii7=1:length(saverow{7})
                A(7,:)=saverow{7}{ii7};
                  if m>7
                  for ii8=1:length(saverow{8})
                  A(8,:)=saverow{8}{ii8};
                    if m>8
                    for ii9=1:length(saverow{9})
                    A(9,:)=saverow{9}{ii9};
                      if m>9
                      for ii10=1:length(saverow{10})
                      A(10,:)=saverow{10}{ii10}; 
                        if m>10
                        for ii11=1:length(saverow{11})
                        A(11,:)=saverow{11}{ii11};
                          if m>11
                          for ii12=1:length(saverow{12})
                          A(12,:)=saverow{12}{ii12}; 
                            if m>12
                            for ii13=1:length(saverow{13})
                            A(13,:)=saverow{13}{ii13}; 
                              if m>13
                              for ii14=1:length(saverow{14})
                              A(14,:)=saverow{14}{ii14}; 
                                if m>14
                                for ii15=1:length(saverow{15})
                                A(15,:)=saverow{15}{ii15}; 
                                  if m>15
                                  for ii16=1:length(saverow{16})
                                  A(16,:)=saverow{16}{ii16}; 
                                    if m>16
                                    for ii17=1:length(saverow{17})
                                    A(17,:)=saverow{17}{ii17}; 
                                      if m>17
                                      for ii18=1:length(saverow{18})
                                      A(18,:)=saverow{18}{ii18}; 
                                        if m>18
                                        for ii19=1:length(saverow{19})
                                        A(19,:)=saverow{19}{ii19}; 
                                          if m>19
                                          for ii20=1:length(saverow{20})
                                          A(20,:)=saverow{20}{ii20}; 
                                            if m>20
                                            for ii21=1:length(saverow{21})
                                            A(20,:)=saverow{21}{ii21}; 
                                              if m>21
                                              for ii22=1:length(saverow{22})
                                              A(22,:)=saverow{22}{ii22}; 
                                                if m>22
                                                for ii23=1:length(saverow{23})
                                                A(23,:)=saverow{23}{ii23}; 
                                                  if m>23
                                                  for ii24=1:length(saverow{24})
                                                  A(24,:)=saverow{24}{ii24}; 
                                                    if m>24
                                                    for ii25=1:length(saverow{25})
                                                    A(25,:)=saverow{25}{ii25}; 
                                                      if m>25
                                                      for ii26=1:length(saverow{26})
                                                      A(26,:)=saverow{26}{ii26}; 
                                                        if m>26
                                                        for ii27=1:length(saverow{27})
                                                        A(27,:)=saverow{27}{ii27}; 
                                                          if m>27
                                                          for ii28=1:length(saverow{28})
                                                          A(28,:)=saverow{28}{ii28};
                                                            if m>28
                                                            for ii29=1:length(saverow{29})
                                                            A(29,:)=saverow{29}{ii29}; 
                                                              if m>29
                                                              for ii30=1:length(saverow{30})
                                                              A(30,:)=saverow{30}{ii30}; 
                                                              toge=[toge,A];
                                                              end
                                                              end
                                                            end
                                                            else
                                                            toge=[toge,A];
                                                            end
                                                          end
                                                          else
                                                          toge=[toge,A];
                                                          end
                                                        end
                                                        else
                                                        toge=[toge,A];
                                                        end
                                                      end
                                                      else
                                                      toge=[toge,A];
                                                      end
                                                    end
                                                    else
                                                    toge=[toge,A];
                                                    end
                                                  end
                                                  else
                                                  toge=[toge,A];
                                                  end
                                                end
                                                else
                                                toge=[toge,A];
                                                end
                                              end
                                              else
                                              toge=[toge,A];
                                              end
                                            end
                                            else
                                            toge=[toge,A];
                                            end
                                          end
                                          else
                                          toge=[toge,A];
                                          end
                                        end
                                        else
                                        toge=[toge,A];
                                        end
                                      end
                                      else
                                      toge=[toge,A];
                                      end
                                    end
                                    else
                                    toge=[toge,A];
                                    end
                                  end
                                  else
                                  toge=[toge,A];
                                  end  
                                end
                                else
                                toge=[toge,A];
                                end  
                              end
                              else
                              toge=[toge,A];
                              end  
                            end
                            else
                            toge=[toge,A];
                            end  
                          end
                          else
                          toge=[toge,A];
                          end
                        end
                        else
                        toge=[toge,A];
                        end
                      end
                      else
                      toge=[toge,A];
                      end
                    end
                    else
                    toge=[toge,A];
                    end
                  end
                  else
                  toge=[toge,A];
                  end
                end
                else
                toge=[toge,A];
                end
              end
              else
              toge=[toge,A];
              end
            end
            else
            toge=[toge,A];
            end
        end
        else
        toge=[toge,A];
        end
        
        end
        
        end
        
    end


   toge2={};
    for ii1=1:length(savecolumn{1})
        A(:,1)=savecolumn{1}{ii1};
        for ii2=1:length(savecolumn{2})
            A(:,2)=savecolumn{2}{ii2};
        for ii3=1:length(savecolumn{3})
            A(:,3)=savecolumn{3}{ii3};
        if n>3
        for ii4=1:length(savecolumn{4})
            A(:,4)=savecolumn{4}{ii4};
            if n>4
            for ii5=1:length(savecolumn{5})
            A(:,5)=savecolumn{5}{ii5};
              if n>5
              for ii6=1:length(savecolumn{6})
              A(:,6)=savecolumn{6}{ii6};
                if n>6
                for ii7=1:length(savecolumn{7})
                A(:,7)=savecolumn{7}{ii7};
                  if n>7
                  for ii8=1:length(savecolumn{8})
                  A(:,8)=savecolumn{8}{ii8};
                    if n>8
                    for ii9=1:length(savecolumn{9})
                    A(:,9)=savecolumn{9}{ii9};
                      if n>9
                      for ii10=1:length(savecolumn{10})
                      A(:,10)=savecolumn{10}{ii10};
                        if n>10
                        for ii11=1:length(savecolumn{11})
                        A(:,11)=savecolumn{11}{ii11};
                          if n>11
                          for ii12=1:length(savecolumn{12})
                          A(:,12)=savecolumn{12}{ii12};
                            if n>12
                            for ii13=1:length(savecolumn{13})
                            A(:,13)=savecolumn{13}{ii13};
                              if n>13
                              for ii14=1:length(savecolumn{14})
                              A(:,14)=savecolumn{14}{ii14};
                                if n>14
                                for ii15=1:length(savecolumn{15})
                                A(:,15)=savecolumn{15}{ii15};
                                  if n>15
                                  for ii16=1:length(savecolumn{16})
                                  A(:,16)=savecolumn{16}{ii16};
                                    if n>16
                                    for ii17=1:length(savecolumn{17})
                                    A(:,17)=savecolumn{17}{ii17};
                                      if n>17
                                      for ii18=1:length(savecolumn{18})
                                      A(:,18)=savecolumn{18}{ii18};
                                        if n>18
                                        for ii19=1:length(savecolumn{19})
                                        A(:,19)=savecolumn{19}{ii19};
                                          if n>19
                                          for ii20=1:length(savecolumn{20})
                                          A(:,20)=savecolumn{20}{ii20};
                                            if n>20
                                            for ii21=1:length(savecolumn{21})
                                            A(:,21)=savecolumn{21}{ii21};
                                              if n>21
                                              for ii22=1:length(savecolumn{22})
                                              A(:,22)=savecolumn{22}{ii22};
                                                if n>22
                                                for ii23=1:length(savecolumn{23})
                                                A(:,23)=savecolumn{23}{ii23};
                                                  if n>23
                                                  for ii24=1:length(savecolumn{24})
                                                  A(:,24)=savecolumn{24}{ii24};
                                                    if n>24
                                                    for ii25=1:length(savecolumn{25})
                                                    A(:,25)=savecolumn{25}{ii25};
                                                      if n>25
                                                      for ii26=1:length(savecolumn{26})
                                                      A(:,26)=savecolumn{26}{ii26};
                                                        if n>26
                                                        for ii27=1:length(savecolumn{27})
                                                        A(:,27)=savecolumn{27}{ii27};
                                                          if n>27
                                                          for ii28=1:length(savecolumn{28})
                                                          A(:,28)=savecolumn{28}{ii28};
                                                            if n>28
                                                            for ii29=1:length(savecolumn{29})
                                                            A(:,29)=savecolumn{29}{ii29};
                                                              if n>29
                                                              for ii30=1:length(savecolumn{30})
                                                              A(:,30)=savecolumn{30}{ii30};
                                                              toge2=[toge2,A];
                                                              end
                                                              end
                                                            end
                                                            else
                                                            toge2=[toge2,A];
                                                            end
                                                          end
                                                          else
                                                          toge2=[toge2,A];
                                                          end
                                                        end
                                                        else
                                                        toge2=[toge2,A];
                                                        end
                                                      end
                                                      else
                                                      toge2=[toge2,A];
                                                      end
                                                    end
                                                    else
                                                    toge2=[toge2,A];
                                                    end
                                                  end
                                                  else
                                                  toge2=[toge2,A];
                                                  end
                                                end
                                                else
                                                toge2=[toge2,A];
                                                end
                                              end
                                              else
                                              toge2=[toge2,A];
                                              end
                                            end
                                            else
                                            toge2=[toge2,A];
                                            end
                                          end
                                          else
                                          toge2=[toge2,A];
                                          end
                                        end
                                        else
                                        toge2=[toge2,A];
                                        end
                                      end
                                      else
                                      toge2=[toge2,A];
                                      end
                                    end
                                    else
                                    toge2=[toge2,A];
                                    end
                                  end
                                  else
                                  toge2=[toge2,A];
                                  end
                                end
                                else
                                toge2=[toge2,A];
                                end
                              end
                              else
                              toge2=[toge2,A];
                              end
                            end
                            else
                            toge2=[toge2,A];
                            end
                          end
                          else
                          toge2=[toge2,A];
                          end
                        end
                        else
                        toge2=[toge2,A];
                        end
                      end
                      else
                      toge2=[toge2,A];
                      end
                    end
                    else
                    toge2=[toge2,A];
                    end
                  end
                  else
                  toge2=[toge2,A];
                  end
                end
                else
                toge2=[toge2,A];
                end
              end
              else
              toge2=[toge2,A];
              end
            end
            else
            toge2=[toge2,A];
            end
        end
        else
        toge2=[toge2,A];
        end
        end

        end

    end

mat2num = @(mat) 2.^(1:numel(mat))*mat(:);
logicMatCell2num = @(logicMatCell) cell2mat(cellfun(mat2num,logicMatCell,'UniformOutput',false));
toge_num = logicMatCell2num(toge);
toge2_num = logicMatCell2num(toge2);
[~,i_toge,i_toge2] = intersect(toge_num,toge2_num);
Paint=toge{i_toge}
Paint

function an=generation_row(leng,need)
    an={};
    if(isempty(need))
        an{1}=zeros(leng);
    else
        hh=zeros(1,leng);
        global gh
        gh={};
        itr(hh,leng,1,1,need);
        an=gh;
    end
end

function an=generation_column(leng,need)
    an={};
    if(isempty(need))
        an{1}=zeros(leng);
    else
        hh=zeros(leng,1);
        global gh
        gh={};
        itr(hh,leng,1,1,need);
        an=gh;
    end
end

function an=itr(hh,leng,head,step,need)
    global gh
    if(step==length(need)+1)
        gh = [gh,hh];
    else
        m=0;
        for i=step:length(need)
            m=m+need(i)+1;
        end
        m=m-1;
        top = leng - head + 1 - m;
        for i=0:top
            for j = 0:need(step)-1
                hh(head+i+j)=1;
            end
            itr(hh,leng,head+i+need(step),step+1,need);
            for j = 0:need(step)-1
                hh(head+i+j)=0;
            end
        end
    end
end


