%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1) The function Unimodal.m checks the unimodality of a single variable 
%    function in a given interval [a b].
% 2) The function is called within the Fibonacci search function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function[umod]=unimodal(s,interval)

    if isempty(s)
        umod=1; % the function is unimdoal
        return;
    end

    for i=1:length(s)
        for j=1:length(s)
            if s(j)==s(i)
                match(i,j)=1;
            else match(i,j)=0;
            end
        end
    end

    for i= 1:length(match)
        for j=1:length(match)
            if match(i,j)==1&&match(j,i)==1
                match(j,i)=0;
                end
        end
    end

    count=0;
    for i= 1:length(match)
        for j=1:length(match)
            if match(i,j)==1
                count=count+1;
                end
        end
    end

    fprintf('\n--->the function derivitive has %d roots',length(s))
    fprintf ('\n--->That means the function has %d minima or maxima in its domain of definition',length(s))
    fprintf('\n--->the derivative function has %d repetitve roots',count)
    fprintf('\n---> for the unimodality condition there should be at max only one minima or maxima in the defined interval ')

    incount=0;
    for i =1:length(s)
        if s(i)>=interval(1)&&s(i)<=interval(2)
            check(i)=1;
            for j=1:length(match)
                if match(i,j)==1
                    incount=incount+1;
                end
            end
        else check(i)=0;
        end
    end

    count=0;
    for i=1:length(check)
        if check(i)==1
            count=count+1;
        end
    end
    finalcount=count-incount;
    if finalcount>1
        umod=0;
        fprintf('\n Since it is not the case,Hence the function is not unimodal in the interval\n')
    else fprintf('\nHence the function is  unimodal in the interval\n')
        umod=1;
    end



