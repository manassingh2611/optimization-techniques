clc
clear 
%% Problem settings
lb = [0 0]       % Lower bound
ub = [10 10]     % Upper bound
prob = @SphereNew;    % Fitness function

%% Algorithm parameters
Np = 10      % Population size
T = 50       % No. of iterations
w = 0.8      % Inertia weight
c1 = 1.5     % Acceleration coffecient
c2 = 1.5     % Acceleration coffecient

%% Particle swarm optimization
f = NaN(Np,1)    % Vector to store the fitness function value of the popualtion

D = length(lb)   % Determining the number of decision variables in the program

P = repmat(lb,Np,1) + repmat((ub-lb),Np,1).*rand(Np,D)   % generation of the initial population
v = repmat(lb,Np,1) + repmat((ub-lb),Np,1).*rand(Np,D)   % generation of the initial velocity

for p = 1:Np
    f(p) = prob(P(p,:))   % Evaluating the fitness function of initial population
end

pbest = P        % Initialize the personal best solutions
f_pbest = f       % Initialize the fitness of the personal best solutions


[f_gbest,ind] = min(f_pbest);    % Determining th best objective function value
gbest = P(ind,:)                % Determining the best solution

for t = 1:T
    
    for p = 1:Np
        v(p,:) = w*v(p,:) + c1*rand(1,D).*(pbest(p,:)-P(p,:)) + c2*rand(1,D).*(gbest - P(p,:))  % Determine new velocity
        
        P(p,:) = P(p,:) + v(p,:)   % Update the postion
        
        P(p,:) = max(P(p,:),lb)   % Bounding the violating variable to therir lower bound
        P(p,:) = min(P(p,:),ub)   % Bounding the violating variable to therir upper bound
        
        f(p) = prob(P(p,:));       % Determining the fitness of the new solution
        
        if f(p) < f_pbest(p)
            
            f_pbest(p) = f(p)    % updating the fitness function value of the personal best solution
            pbest(p,:) = P(p,:);  % updating the personal best solution
            
            if f_pbest < f_gbest
                
                f_gbest = f_pbest(p)  % updating the fitness function value of the best solution
                gbest = pbest(p,:)   % updating the best solution
                
            end
            
        end
    end
    
    %BestFitIter(t+1) = f_gbest;
    %disp(['Iteration' num2str(t) ': Best fitness = ' num2str(BestFitIter(t+1))]);
        
    end
    
    bestfitness = f_gbest
    bestsol = gbest

    %% Convergence with semilog plot
    %%subplot(1,2,1)
    %%plot(0:T,BestFitIter);
    %%xlabel('iteration');
    %%ylabel('Best fitness value');
    
    
    %%subplot(1,2,2)
    %%semilogy(0:T,BestFitIter);
    %%xlabel('Iteration');
    %%ylabel('Best fitness value');
