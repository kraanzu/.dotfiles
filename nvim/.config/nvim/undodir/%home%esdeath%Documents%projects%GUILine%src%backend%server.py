Vim�UnDo� �i���)��B��=&ѷz�%\漿�=}[�#c�s   �                                  a��X    _�                    k       ����                                                                                                                                                                                                                                                                                                                            U          U          v       a���    �   j   l   �      M                    f"{command.perform(self.houses[message.house], message)}"5��    j                     P                     5�_�                    k   M    ����                                                                                                                                                                                                                                                                                                                            U          U          v       a���    �   j   l   �      N                    f"{command}.perform(self.houses[message.house], message)}"5��    j   L                  ~                     5�_�                    o       ����                                                                                                                                                                                                                                                                                                                            U          U          v       a���    �   o   q   �    5��    o                      �                     �    o                     �                    �    o                      �                     5�_�                    >       ����                                                                                                                                                                                                                                                                                                                            U          U          v       a���    �   >   @   �    5��    >                      M                     �    >                      M                     5�_�                    4        ����                                                                                                                                                                                                                                                                                                                            4          G           V       a���    �   F   H           �   E   G          '        self.send_to_users([], message)�   D   F          :            message.text.text = "?warning No such command"�   C   E                  except:�   B   D          "                message.text = msg�   A   C                      if msg:�   @   B          !                self.execute(msg)�   ?   A                      if change:�   >   @           �   =   ?                      )�   <   >          I                f"{special}.perform(self.houses[message.house], message)"�   ;   =                      msg, change = eval(�   :   <          0            special = message.text.text[1:space]�   9   ;          #            space = text.index(" ")�   8   :           �   7   9                          text += " "�   6   8                      if " " not in text:�   5   7          ,            text = message.text.text.strip()�   4   6                  try:�   3   5          8    def _handle_special_message(self, message: Message):5��    3           8       :   �      8       :       �    4                                         �    5           ,       .         ,       .       �    6                  !   I             !       �    7                     k                    �    8                      �                     �    9           #       %   �      #       %       �    :           0       2   �      0       2       �    ;                  !   �             !       �    <           I       K   
      I       K       �    =                     V                    �    >                      f                     �    ?                     l                    �    @           !       #   �      !       #       �    A                     �                    �    B           "       $   �      "       $       �    C                     �                    �    D           :       <   �      :       <       �    E           '       )   3	      '       )       �    F                      ]	                     5�_�                     {       ����                                                                                                                                                                                                                                                                                                                                                             a��W    �               �   import pickle   import socket   from threading import Thread       %from ..backend.utils.text import Text   5from .utils import Rank, Member, House, Message, Text   from .specials import *           class Server:       def __init__(self) -> None:   4        self.SERVER: socket.socket = socket.socket()   $        self.HOST: str = "localhost"           self.PORT: int = 5500   5        self.users: dict[str, socket.socket] = dict()   .        self.houses: dict[str, House] = dict()            self.chat_boss = Member(   X            username="SERVER", rank=Rank("server", color="bold red", power=float("inf"))   	        )       (    def execute(self, message: Message):           house = message.house   $        task = message.text.text[1:]   *        action, param = task.split(" ", 2)           if action == "addroom":   2            self.houses[house].rooms.append(param)   !        elif action == "delroom":   2            self.houses[house].rooms.remove(param)   "        elif action == "addhouse":   '            self.houses[param] = House(                   name=param,                   mode="open",   $                king=message.sender,   9                conn=self.users[message.sender.username],               )   )        elif action in ("leave", "kick"):   4            self.houses[house].members.remove(param)           elif action == "join":   F            self.houses[house].members.append(message.sender.username)           elif action == "ban":               try:   8                self.houses[house].members.remove(param)               except:                   pass   3            self.houses[house].banned.append(param)   $        elif action == "changerank":   0            user, new_rank = param.split(" ", 2)   =            self.houses[house].member_data[user].change_rank(   2                self.houses[house].ranks[new_rank]               )       :    # def _handle_special_message(self, message: Message):       #     try:   .    #         text = message.text.text.strip()   !    #         if " " not in text:       #             text += " "       #   %    #         space = text.index(" ")   2    #         special = message.text.text[1:space]   !    #         msg, change = eval(   K    #             f"{special}.perform(self.houses[message.house], message)"       #         )       #       #         if change:   #    #             self.execute(msg)       #         if msg:   $    #             message.text = msg       #     except:   <    #         message.text.text = "?warning No such command"   )    #     self.send_to_users([], message)       #   .    def listen_from_user(self, username: str):   "        conn= self.users[username]           while True:   3            message = pickle.loads(conn.recv(2048))   6            for user,connection in self.users.items():   $                if user != username:   =                    connection.sendall(pickle.dumps(message))       )            # if message.house == "HOME":   6            #     self.handle_local_messsages(message)               # else:   7            #     self.handle_global_messsages(message)       .    def handle_local_messsages(self, message):            text = message.text.text   %        if message.room == "general":   .            command, param= text.split(" ", 2)   "            if command == "?join":   7                self.houses[param].accept(message.user)   '            elif command == "?request":   $                raise NotImplemented   *            elif command == "?makefriend":   $                raise NotImplemented           else:   7            self.send_to_users([message.room], message)       /    def handle_global_messsages(self, message):            text = message.text.text           if text[0] == "?":               try:                   try:   7                    command = text[1 : text.index(" ")]                   except:   &                    command = text[1:]       /                msg, execute, recievers = eval(   M                    f"{command}.perform(self.houses[message.house], message)"                   )   "                message.text = msg                   if execute:                       pass       6                self.send_to_users(recievers, message)                   except:   #                self.send_to_users(   .                    [message.sender.username],                       Message(   .                        sender=self.chat_boss,   [                        text=Text("Invalid smessage.text.textpecial command", color="red"),   ,                        house=message.house,   *                        room=message.room,                       ),                   )       @    def send_to_users(self, users: list[str], message: Message):   $        data = pickle.dumps(message)           if not users:   =            for member in self.houses[message.house].members:   5                if member != message.sender.username:   4                    self.users[member].sendall(data)           else:                for member in users:   0                self.users[member].sendall(data)       #    def start_server(self) -> None:           global SERVER   I        self.SERVER.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)       0        self.SERVER.bind((self.HOST, self.PORT))           self.SERVER.listen()   0        print("[+] SERVER IS UP AND RUNNING...")   /        print("[+] WAITING FOR CONNECTIONS...")               try:               while True:   .                conn, _ = self.SERVER.accept()   3                username = conn.recv(1024).decode()   +                self.users[username] = conn   9                self.houses[f"{username}.house"] = House(   I                    name="HOME", mode="private", king=username, conn=conn                   )       @                print(f"[+] {username} connected to the server")   ,                user_listen_thread = Thread(   O                    target=self.listen_from_user, args=(username,), daemon=True                   )   *                user_listen_thread.start()           except:   #            print("SERVER CRASHED")               self.SERVER.close()5�5�_�                    U       ����                                                                                                                                                                                                                                                                                                                            U          U          v       a���     �   T   V   �              text = message.text.5��    T                     _                     5�_�                     U       ����                                                                                                                                                                                                                                                                                                                            U          U          v       a���     �   T   V   �              text = message.text.5��    T                     _                     5��