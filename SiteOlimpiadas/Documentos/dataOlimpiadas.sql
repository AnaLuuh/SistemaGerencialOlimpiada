USE [Olimpiadas]
GO
/****** Object:  Table [dbo].[Tutorial]    Script Date: 05/04/2016 22:56:21 ******/
SET IDENTITY_INSERT [dbo].[Tutorial] ON
INSERT [dbo].[Tutorial] ([ID], [NomeTutorial], [DescTutorial]) VALUES (2, N'Como fazer login', N'Teste')
INSERT [dbo].[Tutorial] ([ID], [NomeTutorial], [DescTutorial]) VALUES (3, N'Como criar uma conta', N'Crie a conta')
SET IDENTITY_INSERT [dbo].[Tutorial] OFF
/****** Object:  Table [dbo].[Perfil]    Script Date: 05/04/2016 22:56:21 ******/
SET IDENTITY_INSERT [dbo].[Perfil] ON
INSERT [dbo].[Perfil] ([ID], [DescPerfil]) VALUES (8, N'Admin     ')
INSERT [dbo].[Perfil] ([ID], [DescPerfil]) VALUES (9, N'Operacional')
SET IDENTITY_INSERT [dbo].[Perfil] OFF
/****** Object:  Table [dbo].[Modalidade]    Script Date: 05/04/2016 22:56:21 ******/
SET IDENTITY_INSERT [dbo].[Modalidade] ON
INSERT [dbo].[Modalidade] ([ID], [DescModalidade], [InfoModalidade]) VALUES (1, N'Vôlei de Praia', N'O vôlei de praia é praticado numa quadra, demarcada com fita, na areia. As medidas são: 16 metros de comprimento por 8 metros de largura. No meio, deve ficar uma rede que mede 2,43 metros de altura (masculino) ou 2,24 metros (feminino).')
INSERT [dbo].[Modalidade] ([ID], [DescModalidade], [InfoModalidade]) VALUES (2, N'Voleibol', N'O vôlei, também chamado de volley ou voleibol, é um esporte de origem norte-americana do século XIX. É um esporte de popularidade significativa em grande parte do mundo, e está presente em muitos torneios e eventos esportivos de âmbito internacionais, tais como os Jogos Olímpicos e os Jogos Panamericanos. Pode ser praticado tanto em quadras abertas quanto em quadras fechadas, bem como é praticado quase que igualmente tanto por homens quanto mulheres.')
INSERT [dbo].[Modalidade] ([ID], [DescModalidade], [InfoModalidade]) VALUES (3, N'Ginástica Artística', N'A ginástica artística, também conhecida como ginástica olímpica é um esporte que requer força, agilidade, coordenação, controle do corpo, flexibilidade, equilíbrio e elegância. Os ginastas realizam exercícios em aparelhos oficiais.')
INSERT [dbo].[Modalidade] ([ID], [DescModalidade], [InfoModalidade]) VALUES (4, N'Futebol', N'O objetivo do jogo de futebol é conduzir uma bola na baliza da equipe adversária, a fim de marcar um ponto. A equipe quie tiver mas pontos no final de uma partida de futebol ganha; se houver um empate, o jogo vai para a prorrogação ou o árbitro declara um empate. O futebol é jogado ao ar livre em um campo retangular de grama ou turfe, com uma baliza localizada no meio de ambas as extremidades curtas do campo. O futsal é semelhante, embora a quadra seja menor. Existem 11 membros em cada equipe, jogando atacante, meio-campo, zagueiro e goleiro.')
SET IDENTITY_INSERT [dbo].[Modalidade] OFF
/****** Object:  Table [dbo].[Local]    Script Date: 05/04/2016 22:56:21 ******/
SET IDENTITY_INSERT [dbo].[Local] ON
INSERT [dbo].[Local] ([ID], [DescLocal]) VALUES (1, N'São Paulo')
INSERT [dbo].[Local] ([ID], [DescLocal]) VALUES (2, N'Belo Horizonte')
SET IDENTITY_INSERT [dbo].[Local] OFF
/****** Object:  Table [dbo].[InformacaoBH]    Script Date: 05/04/2016 22:56:21 ******/
SET IDENTITY_INSERT [dbo].[InformacaoBH] ON
INSERT [dbo].[InformacaoBH] ([ID], [Informacao]) VALUES (1, N'Belo Horizonte é um município brasileiro e a capital do estado de Minas Gerais. Pertence à Mesorregião Metropolitana de Belo Horizonte e à Microrregião de Belo Horizonte. Com uma área de aproximadamente 331 km², possui uma geografia diversificada, com morros e baixadas, distando 716 quilômetros de Brasília, a capital nacional, sendo a segunda capital de estado mais próxima da capital federal, atrás apenas de Goiânia')
SET IDENTITY_INSERT [dbo].[InformacaoBH] OFF
/****** Object:  Table [dbo].[Usuario]    Script Date: 05/04/2016 22:56:21 ******/
SET IDENTITY_INSERT [dbo].[Usuario] ON
INSERT [dbo].[Usuario] ([ID], [Nome], [CPF], [Email], [Senha], [Logradouro], [Numero], [Bairro], [Cidade], [UF], [DataNascimento], [Perfil_ID]) VALUES (1, N'Ana Lu', N'11900266601', N'ana@hotmail.com', N'202cb962ac59075b964b07152d234b70', N'Av dos Jardins', 572, N'Lindéia', N'Belo Horizonte', N'MG', N'1995-08-26', 8)
INSERT [dbo].[Usuario] ([ID], [Nome], [CPF], [Email], [Senha], [Logradouro], [Numero], [Bairro], [Cidade], [UF], [DataNascimento], [Perfil_ID]) VALUES (2, N'Warlen', N'123464552', N'warlen@hotmail.com', N'202cb962ac59075b964b07152d234b70', N'Avenida', 852, N'Betania', N'Belo Horizonte', N'MG', N'2005-08-26', NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
/****** Object:  Table [dbo].[Evento]    Script Date: 05/04/2016 22:56:21 ******/
SET IDENTITY_INSERT [dbo].[Evento] ON
INSERT [dbo].[Evento] ([ID], [Modalidade_ID], [Local_ID], [Data], [Horario], [NomeEvento]) VALUES (1, 1, 1, CAST(0x0000A66800000000 AS DateTime), N'10:00', N'Abertura da Olimpíada')
INSERT [dbo].[Evento] ([ID], [Modalidade_ID], [Local_ID], [Data], [Horario], [NomeEvento]) VALUES (2, 2, 2, CAST(0x0000A65E00000000 AS DateTime), N'17:00', N'Semi Final Brasil x Uruguai')
SET IDENTITY_INSERT [dbo].[Evento] OFF
/****** Object:  Table [dbo].[EventoUsuario]    Script Date: 05/04/2016 22:56:21 ******/
SET IDENTITY_INSERT [dbo].[EventoUsuario] ON
INSERT [dbo].[EventoUsuario] ([ID], [Usuario_ID], [Evento_ID]) VALUES (3, 1, 2)
INSERT [dbo].[EventoUsuario] ([ID], [Usuario_ID], [Evento_ID]) VALUES (4, 1, 1)
SET IDENTITY_INSERT [dbo].[EventoUsuario] OFF
/****** Object:  Table [dbo].[Ingresso]    Script Date: 05/04/2016 22:56:21 ******/
