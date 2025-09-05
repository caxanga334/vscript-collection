# Bot Auto Balancer

On Team Fortress 2, the built-in auto team balance code ignore bots.
This script will automatically move bots to teams with less players when a client disconnects.      
Respects the `mp_autoteambalance` and `mp_teams_unbalance_limit` ConVars.    
Compatibility with game modes that uses the ConVars listed above to control the auto team balance.    
Not compatible with Mann vs Machine!    

## Usage:

Run `script_execute botautobalancer.nut` once per map.