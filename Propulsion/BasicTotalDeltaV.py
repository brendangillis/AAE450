import numpy as np



class RocketStage:
    def __init__(self, dry_mass, fuel_mass, isp, burn_time, name, cost):
        self.isp        = isp               # specific impulse [s]
        self.dry_mass   = dry_mass          # dry mass [metric Tons]
        self.fuel_mass  = fuel_mass         # fuel mass [metric Tons]
        self.mass = dry_mass + fuel_mass    # total mass [metric Tons]
        self.burn_time  = burn_time         # burn time [s]
        self.name       = name              # stage name
        self.cost       = cost              # cost [$ Million]
        self.dV         = 0                 # delta V [m/s]
        
    def stage_dV(self, num_stage, payload):
        self.dV  = 9.81 * self.isp * np.log( (num_stage*self.mass + payload) / (num_stage*self.dry_mass + payload))
        return self.dV
    
class Configuration:
    def __init__(self, stages):
        # Stages take the form [stage, number of stages]
        self.stages     = stages
        self.name       = [str(stage[1]) + ' ' +  stage[0].name for stage in self.stages]
        self.name       = ',  '.join(self.name)
        
    def total_dV(self, payload):
        dV = 7800 + 30000 - 11200              # V_LEO + V_Earth - V_Escape [m/s]
        for i, stage in enumerate(self.stages):
            upper_stage_mass = sum(stage[0].mass * stage[1] for stage in self.stages[i+1:])
            dV += stage[0].stage_dV(stage[1], payload + upper_stage_mass)
        return dV
    
    def total_cost(self):
        cost = 0
        for i, stage in enumerate(self.stages):
            cost += stage[0].cost * stage[1]
        return cost
    

class RocketChoices:
    def __init__(self):
        self.starship = RocketStage(
            dry_mass    = 80,
            fuel_mass   = 1200,
            isp         = 380,
            burn_time   = 0.0,
            name        = 'Starship',
            cost        = 0.0
        )
    
        self.centaur = RocketStage(
            dry_mass    = 2.46,
            fuel_mass   = 20.8,
            isp         = 453,
            burn_time   = 0.0,
            name        = 'Centaur',
            cost        = 20
        )
    
        self.F9Upper = RocketStage(
            dry_mass    = 2,
            fuel_mass   = 100,
            isp         = 363,
            burn_time   = 0.0,
            name        = 'F9-Upper-Stage',
            cost        = 15
        )
    
        self.gem46 = RocketStage(
            dry_mass    = 2.28,
            fuel_mass   = 16.9,
            isp         = 274,
            burn_time   = 0.0,
            name        = 'Gem-46',
            cost        = 8*2.28
        )
    
        self.castor = RocketStage(
            dry_mass    = 1.9,
            fuel_mass   = 13.1,
            isp         = 282,
            burn_time   = 0.0,
            name        = 'Castor',
            cost        = 8*1.9
        )
        
        return


def main():
    # Initialize rocket stages
    rocketChoices = RocketChoices()
    
    # Initialize rocket configuration
    configSLS   = Configuration([[rocketChoices.centaur, 1]])
    configs     = [Configuration([ [rocketChoices.starship, 1], [rocketChoices.F9Upper, 1]])]
    #configs.append(Configuration([ [rocketChoices.starship, 1], [rocketChoices.centaur, 1]]))
    #configs.append(Configuration([ [rocketChoices.starship, 1], [rocketChoices.gem46, 2], [rocketChoices.centaur, 1]]))
    #configs.append(Configuration([ [rocketChoices.starship, 1], [rocketChoices.gem46, 3], [rocketChoices.centaur, 1]]))
    #configs.append(Configuration([ [rocketChoices.starship, 1], [rocketChoices.castor, 2], [rocketChoices.centaur, 1]]))
    #configs.append(Configuration([ [rocketChoices.starship, 1], [rocketChoices.castor, 3], [rocketChoices.centaur, 1]]))
    #configs.append(Configuration([ [rocketChoices.starship, 1], [rocketChoices.castor, 4], [rocketChoices.centaur, 1]]))
    #configs.append(Configuration([[rocketChoices.starship, 1]]))

    mass1 = 3.078 # [metric tons]
    mass2 = 4.0 # [metric tons]
    mass3 = 5.0 # [metric tons]
    print('\nROCKET CONFIGURATIONS:')
    print('V_leo + V_kick + V_earth - V_escape')
    print('  {:<36}  | {} tons | {} tons | {} tons | Cost [$M] |'.format(' ', mass1, mass2, mass3))

    # Calculate SLS DV seperatly because it does not go to parking orbit
    # Add 4,500 m/s to the SLS DV to account for extra compared to LEO
    #print('  {:<40} {:,.0f},    {:,.0f},    {:,.0f},    {:,.1f}'.format('SLS + ' + configSLS.name, configSLS.total_dV(mass1)+4500, configSLS.total_dV(mass2)+4500, configSLS.total_dV(mass3)+4500, configSLS.total_cost()))
    
    for config in configs:
        print('  {:<40} {:,.3f},    {:,.3f},    {:,.3f},    {:,.1f}'.format(config.name, config.total_dV(mass1)/1000, config.total_dV(mass2)/1000, config.total_dV(mass3)/1000, config.total_cost()))
    

    for config in configs:
        post_leo_dv = 0
        config.total_dV(mass1)
        for stage in config.stages:
            post_leo_dv += stage[0].dV
            print("{}: {:,.3f}".format(stage[0].name, stage[0].dV/1000))
        print("Post-LEO DV: {:,.3f}".format(post_leo_dv/1000))
    return


if __name__ == "__main__":
    
    main()
