import numpy as np



class RocketStage:
    def __init__(self, dry_mass, fuel_mass, isp, burn_time, name, cost):
        self.isp        = isp               # specific impulse [s]
        self.dry_mass   = dry_mass          # dry mass [metric Tons]
        self.fuel_mass  = fuel_mass         # fuel mass [metric Tons]
        self.mass = dry_mass + fuel_mass    # total mass [metric Tons]
        self.burn_time  = burn_time         # burn time [s]
        self.name       = name              # stage name
        self.cost       = cost                 # cost [$ Million]
        
    def stage_dV(self, num_stage, payload):
        dV  = 9.81 * self.isp * np.log( (num_stage*self.mass + payload) / (num_stage*self.dry_mass + payload))
        return dV
    
class Configuration:
    def __init__(self, stages):
        self.stages     = stages
        self.name       = [str(stage[1]) + ' ' +  stage[0].name for stage in self.stages]
        self.name       = ',  '.join(self.name)
        
    def total_dV(self, payload):
        dV = 7800 + 30000 - 11200              # Earth to LEO from Launch Vehicle [m/s]
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
    configs     = [(Configuration([ [rocketChoices.starship, 1]]))]
    configs.append((Configuration([ [rocketChoices.starship, 1], [rocketChoices.F9Upper, 1]])))
    configs.append(Configuration([ [rocketChoices.starship, 1], [rocketChoices.centaur, 1]]))
    configs.append(Configuration([ [rocketChoices.starship, 1], [rocketChoices.gem46, 2], [rocketChoices.centaur, 1]]))
    configs.append(Configuration([ [rocketChoices.starship, 1], [rocketChoices.gem46, 3], [rocketChoices.centaur, 1]]))
    configs.append(Configuration([ [rocketChoices.starship, 1], [rocketChoices.castor, 2], [rocketChoices.centaur, 1]]))
    configs.append(Configuration([ [rocketChoices.starship, 1], [rocketChoices.castor, 3], [rocketChoices.centaur, 1]]))
    configs.append(Configuration([ [rocketChoices.starship, 1], [rocketChoices.castor, 4], [rocketChoices.centaur, 1]]))
    
    print('\nROCKET CONFIGURATIONS:')
    print('V_leo + V_kick + V_earth - V_escape')
    print('  {:<36}  |  1 tons  |  2 tons  |  3 tons | Cost [$M] |'.format(' '))
    print('  {:<40} {:,.0f},    {:,.0f},    {:,.0f},    {:,.1f}'.format('SLS + ' + configSLS.name, configSLS.total_dV(1)+4500, configSLS.total_dV(2)+4500, configSLS.total_dV(3)+4500, configSLS.total_cost()))
    
    for config in configs:
        print('  {:<40} {:,.0f},    {:,.0f},    {:,.0f},    {:,.1f}'.format(config.name, config.total_dV(1), config.total_dV(2), config.total_dV(3), config.total_cost()))
    
        
    return


if __name__ == "__main__":
    
    main()
