import numpy as np



class RocketStage:
    def __init__(self, dry_mass, fuel_mass, isp, burn_time, name):
        self.isp        = isp               # specific impulse [s]
        self.dry_mass   = dry_mass          # dry mass [metric Tons]
        self.fuel_mass  = fuel_mass         # fuel mass [metric Tons]
        self.mass = dry_mass + fuel_mass    # total mass [metric Tons]
        self.burn_time  = burn_time         # burn time [s]
        self.name       = name              # stage name
        
    def stage_dV(self, num_stage, payload):
        dV  = 9.81 * self.isp * np.log( (num_stage*self.mass + payload) / (num_stage*self.dry_mass + payload))
        return dV
    
class Configuration:
    def __init__(self, stages):
        self.stages     = stages
        self.name       = [str(stage[1]) + ' ' +  stage[0].name for stage in self.stages]
        self.name       = ',  '.join(self.name)
        
    def total_dV(self, payload):
        dV = 9800              # Earth to LEO from Launch Vehicle [m/s]
        for i, stage in enumerate(self.stages):
            upper_stage_mass = sum(stage[0].mass * stage[1] for stage in self.stages[i+1:])
            dV += stage[0].stage_dV(stage[1], payload + upper_stage_mass)
        return dV
    

class RocketChoices:
    def __init__(self):
        self.starship = RocketStage(
            dry_mass    = 80,
            fuel_mass   = 1200,
            isp         = 380,
            burn_time   = 0.0,
            name        = 'Starship'
        )
    
        self.centaur = RocketStage(
            dry_mass    = 2.46,
            fuel_mass   = 20.8,
            isp         = 453,
            burn_time   = 0.0,
            name        = 'Centaur'
        )
    
        self.F9Upper = RocketStage(
            dry_mass    = 2,
            fuel_mass   = 92,
            isp         = 363,
            burn_time   = 0.0,
            name        = 'F9-Upper-Stage'
        )
    
        self.gem46 = RocketStage(
            dry_mass    = 2.28,
            fuel_mass   = 16.9,
            isp         = 274,
            burn_time   = 0.0,
            name        = 'Gem-46'
        )
    
        self.castor = RocketStage(
            dry_mass    = 1.9,
            fuel_mass   = 13.1,
            isp         = 282,
            burn_time   = 0.0,
            name        = 'Castor'
        )
        
        return




def main():
    
    # Initialize rocket stages
    rocketChoices = RocketChoices()
    
    # Initialize rocket configuration
    configs = [Configuration([ [rocketChoices.starship, 1], [rocketChoices.F9Upper, 1]])]
    configs.append(Configuration([ [rocketChoices.starship, 1], [rocketChoices.centaur, 1]]))
    configs.append(Configuration([ [rocketChoices.starship, 1], [rocketChoices.gem46, 2], [rocketChoices.centaur, 1]]))
    configs.append(Configuration([ [rocketChoices.starship, 1], [rocketChoices.gem46, 3], [rocketChoices.centaur, 1]]))
    configs.append(Configuration([ [rocketChoices.starship, 1], [rocketChoices.castor, 2], [rocketChoices.centaur, 1]]))
    configs.append(Configuration([ [rocketChoices.starship, 1], [rocketChoices.castor, 3], [rocketChoices.centaur, 1]]))
    configs.append(Configuration([ [rocketChoices.starship, 1], [rocketChoices.castor, 4], [rocketChoices.centaur, 1]]))
    
    print('\nROCKET CONFIGURATIONS:')
    print('  {:<36}  |  1 tons  |  2 tons  |  3 tons |'.format(' '))
    for config in configs:
        print('  {:<40} {:,.0f},    {:,.0f},    {:,.0f}'.format(config.name, config.total_dV(1), config.total_dV(2), config.total_dV(3)))
    
        
    return


if __name__ == "__main__":
    
    main()
