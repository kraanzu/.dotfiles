Vim�UnDo� #�7��Q{q{�.��4#n� M|����<      ?        return("?warning No name for banning was given", False)      >      *       *   *   *    a�5I    _�                             ����                                                                                                                                                                                                                                                                                                                                                             a�B�     �                 &from backend.utils import Room, Member           ,def perform(room: Room, who: Member, users):   1    users = [i.strip() for i in users.split(",")]           for user in users:           try:   (            _ = room.house.members[user]   3            room.house.rooms["general"]._broadcast(   L                "CHATTER_HOUSE", f"user {user} was banned by {who.username}"               )   (            room.house.banned += (user,)           except:   X            who.conn.send(f"No user with username {user} present in the house".encode())5��                                   �              5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             a�B�     �                   �               5�5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             a�B�     �                   �               5�5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             a�B�     �                   �               5�5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             a�B�     �                   �               5�5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             a�B�     �                   �               5�5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             a�B�     �                   �               5��                                         >      5�_�      	                      ����                                                                                                                                                                                                                                                                                                                                                             a�B�     �                  5��                                                  5�_�      
           	          ����                                                                                                                                                                                                                                                                                                                                                             a�B�     �      	         1        room_to_add = text[text.index(" ") + 1 :]5��                        �                     �                        �                     �                        �                     �                         �                      �                        �                     �                         �                      �       
                  �                      �       	                  �                      �                        �                     �                         �                      �                         �                      �       
                  �                      �       	                  �                      �                        �                     �                         �                      5�_�   	              
          ����                                                                                                                                                                                                                                                                                                                                                             a�B�     �               &        if room_to_add in house.rooms:5��                        _                    �                         c                     �                     	   b             	       �                         j                     5�_�   
                 
   ;    ����                                                                                                                                                                                                                                                                                                                                                             a�C*     �   	            E        if message.sender.rank.power <  house.threshholds["addroom"]:5��    	   ;                                     �    	   ;                                     �    	   ;                                     5�_�                    
   ?    ����                                                                                                                                                                                                                                                                                                                                                             a�C-    �   	            B        if message.sender.rank.power <  house.threshholds["band"]:5��    	   >                                       5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             a�C2     �               &        if user_to_ban in house.rooms:5��                        j                    �                         k                     �                        j                    �                         l                     �                         k                     �                        j                    �                         m                     �                         l                     �                         k                     �                        j                    �                         m                     �                         l                     �                         k                     �                         j                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             a�C9     �               !        if user_to_ban in .rooms:5��                        j                    �                         k                     �                        j                    �                         l                     �                         k                     �                        j                    �                         m                     �                         l                     �                         k                     �                        j                    �                         n                     �                         m                     �                         l                     �                         k                     �                        j                    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             a�C<    �               !        if user_to_ban in house.:5��                          p                     �                         p                    �       !                  q                     �                         p                    �       !                  q                     �                         p                    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             a�CC     �               L            return("?warning Room with same name is already present", False)5��                        �                    �                        �                    �                        �                    �                        �                    5�_�                       ,    ����                                                                                                                                                                                                                                                                                                                                                             a�CG     �               L            return("?warning User with same name is already present", False)5��       ,                  �                     �       ,                 �                    �       ,                 �                    5�_�                       G    ����                                                                                                                                                                                                                                                                                                                                                             a�CK     �               P            return("?warning User with same username is already present", False)5��       G                  �                     �       H                 �                    �       K                 �                    �       K                 �                    �       O                 �                    �       O                 �                    �       O                 �                    �       R                 �                    �       O                 �                    �       O                 �                    �       O                 �                    5�_�                       %    ����                                                                                                                                                                                                                                                                                                                                                             a�C[    �                 <        return("?warning No name for room was given", False)5��       %                 :                    �       %                 :                    �       %                 :                    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             a�4�     �                 (from backend.utils import House, Message5��                                   )               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             a�4�     �                 5��                                                  �                                                �                                                �                                              �                                                �                                                �                                                �                                                �                                                �                                                �                                                �                                                �                                                �                                                �                                                �                                                �                                                �                                                �                                                �                                                �                                                �                                                �                                                �                                                �                                                �                                                �                                                �                                                �                                                �                                              �                                                �                                                �                                                �                                                5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             a�4�     �                from .5��                                                5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             a�4�    �                from ..5��                                                �                                                �                                                5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             a�4�     �                from5��                                                5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             a�4�    �                from .5��                                                �                                                �                                                �                                                �                                               �                                              �                                               �                                               �                                              �                                               �                                               �                                               �                                              �                         	                      �                                               �                                               �                                               �                                              �                         	                      �                                               �                                               �                                               �                                                �                                                5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             a�5     �                from5��                                                5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             a�5     �                from .5��                                                �                                                �                                                �                                                �                                              �                                                �                                                �                                                5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             a�5     �                from .5��                                                5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             a�5     �                from ..5��                                                �                                              �                                              �                                                �                                                �                                              5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             a�5     �                from .5��                                                5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             a�5      �                from ..5��                                                �                                              �                                                �                                              �        	                  	                      �                                                �                                              �        
                  
                      �        	                  	                      �                                                �                                              �                                                �        
                  
                      �        	                  	                      �                                                �                                              �                                                �                                              �                                                �                                                �                                              �                                                �                                                �                                                �                                              �                                                �                                                �                                                �                                                �                                              �                                                �                                                �                                                �                                                �                                                �                                              �                                              5�_�      !                      ����                                                                                                                                                                                                                                                                                                                                                             a�5$   
 �                from ..utils import House,5��                                                �                                              �                                                �                                              5�_�       "           !      >    ����                                                                                                                                                                                                                                                                                                                                                             a�56     �               @def perform(house: House, message: Message) -> tuple[str, bool]:5��       >                  b                      5�_�   !   #           "      ?    ����                                                                                                                                                                                                                                                                                                                                                             a�56     �               Adef perform(house: House, message: Message) -> tuple[str, bool,]:5��       ?                  c                      �       @                 d                     �       @                 d                     �       @                 d                     �       E                 i                     �       E                 i                     �       E                 i                     5�_�   "   $           #   
   C    ����                                                                                                                                                                                                                                                                                                                                                             a�5;     �   	            D            return("?warning You are not allowed to do this", False)5��    	   C                  Q                     5�_�   #   %           $   
   D    ����                                                                                                                                                                                                                                                                                                                                                             a�5;     �   	            E            return("?warning You are not allowed to do this", False,)5��    	   D                  R                     �    	   E                 S                    5�_�   $   &           %      b    ����                                                                                                                                                                                                                                                                                                                                                             a�5A     �               c            return("?warning User with same username is already present in the banned list", False)5��       b                  �                     5�_�   %   '           &      c    ����                                                                                                                                                                                                                                                                                                                                                             a�5A     �               d            return("?warning User with same username is already present in the banned list", False,)5��       c                  �                     �       f                 �                    �       f                  �                     �       e                  �                     �       d                 �                    �       e                 �                    5�_�   &   (           '      %    ����                                                                                                                                                                                                                                                                                                                                                             a�5E     �               &        return (message.message, True)5��       %                                       5�_�   '   )           (      &    ����                                                                                                                                                                                                                                                                                                                                                             a�5E     �               '        return (message.message, True,)5��       &                                       �       (                                     5�_�   (   *           )      >    ����                                                                                                                                                                                                                                                                                                                                                             a�5H     �                 ?        return("?warning No name for banning was given", False)5��       >                  b                     5�_�   )               *      ?    ����                                                                                                                                                                                                                                                                                                                                                             a�5H    �                 @        return("?warning No name for banning was given", False,)5��       ?                  c                     �       A                 e                    5��