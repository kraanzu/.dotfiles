Vim�UnDo� ���f��0���%�̫�$*?Gp�R�?�      ),                             a�ݢ   	 _�                             ����                                                                                                                                                                                                                                                                                                                                                             a��(    �                   �               5��                                          ?      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             a��F     �                �             5��                          $                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             a��L     �                   return [5��                        �                    �                        �                    �                        �                    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             a��P     �                     �               5��                          _                     �                          _                     �                         _                     �                          `                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             a��[     �                def get_open_sessions():5��                          �                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       a��_    �                   arr =  [           i[: i.index(":")]   R        for i in check_output(["tmux", "list-sessions"]).decode().split("\n")[:-1]       ]5��                          �                     �                         �                    �                         �                    �                          4                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       a��b     �                  #from subprocess import check_output   from libqtile.lazy import lazy       dmenu_config = {   "    # "dmenu_prompt": "Command: ",       "dmenu_ignorecase": "True",   0    "dmenu_font": "SauceCodePro Nerd Font Semi",       "background": "#2e3440",       "foreground": "#8fbcbb",   %    "selected_background": "#4c566a",   %    "selected_foreground": "#88c0d0",       # "dmenu_lines": 10,   =    "dmenu_height": 30,  # Only supported by some dmenu forks       "dmenu_bottom": "True",   }           arr =  [       i[: i.index(":")]   N    for i in check_output(["tmux", "list-sessions"]).decode().split("\n")[:-1]   ]        5�5�_�      	                      ����                                                                                                                                                                                                                                                                                                                                                V       a��w    �                  �               �               5��                          5                     �                      
   5              
      5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                                V       a��~     �                5��                          �                     �                         �                    �                         �                    �                         �                    �                         �                    �                         �                     �                         �                     �                         �                     �                         �                     �                         �                     �                          �                     5�_�   	              
           ����                                                                                                                                                                                                                                                                                                                                                V       a�݅    �                �             �                5��                          �                     �                          �              6       5�_�   
                         ����                                                                                                                                                                                                                                                                                                                                                V       a�ݕ     �                   #from subprocess import check_output   from libqtile.lazy import lazy       dmenu_config = {   "    # "dmenu_prompt": "Command: ",       "dmenu_ignorecase": "True",   0    "dmenu_font": "SauceCodePro Nerd Font Semi",       "background": "#2e3440",       "foreground": "#8fbcbb",   %    "selected_background": "#4c566a",   %    "selected_foreground": "#88c0d0",       # "dmenu_lines": 10,   =    "dmenu_height": 30,  # Only supported by some dmenu forks       "dmenu_bottom": "True",   }       5from libqtile.extension.command_set import CommandSet           arr = [       i[: i.index(":")]   N    for i in check_output(["tmux", "list-sessions"]).decode().split("\n")[:-1]   ]   lazy.run_extension(               CommandSet(                   commands={   R                    i: f"alacritty -e tmux a -t {i}&" for i in get_open_sessions()                   },   $                dmenu_prompt="TMUX",                   **dmenu_config,               )   
        ),5�5�_�                       =    ����                                                                                                                                                                                                                                                                                                                                                V       a�ݜ    �               R        commands={i: f"alacritty -e tmux a -t {i}&" for i in get_open_sessions()},5��       =                 �                    �       >                  �                     �       =                 �                    �       ?                  �                     �       >                  �                     �       =                 �                    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       a�ݡ   	 �                 ),5��                                              5��