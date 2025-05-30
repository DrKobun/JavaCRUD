-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26/05/2025 às 02:41
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `paciente`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `atendimento`
--

CREATE TABLE `atendimento` (
  `id` int(11) NOT NULL,
  `idPaciente` int(10) NOT NULL,
  `dataAtendimento` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `atendimento`
--

INSERT INTO `atendimento` (`id`, `idPaciente`, `dataAtendimento`, `status`) VALUES
(45, 79, '2025-05-25 17:09:14', 'Aguardando Triagem'),
(46, 79, '2025-05-25 17:09:52', 'Aguardando Triagem'),
(47, 79, '2025-05-25 17:10:15', 'Aguardando Triagem'),
(48, 79, '2025-05-25 17:10:56', 'Aguardando Triagem'),
(49, 79, '2025-05-25 17:12:00', 'Aguardando Triagem'),
(50, 79, '2025-05-25 17:15:42', 'Aguardando Triagem'),
(51, 79, '2025-05-25 17:17:38', 'Aguardando Triagem'),
(52, 79, '2025-05-25 17:18:55', 'Aguardando Triagem'),
(53, 79, '2025-05-25 17:20:41', 'Aguardando Triagem'),
(54, 79, '2025-05-25 17:22:16', 'Aguardando Triagem'),
(55, 79, '2025-05-25 17:43:30', 'Aguardando Triagem'),
(56, 79, '2025-05-25 18:02:03', 'Aguardando Triagem'),
(57, 79, '2025-05-25 18:36:27', 'Aguardando Triagem'),
(58, 79, '2025-05-25 18:38:30', 'Aguardando Triagem'),
(59, 79, '2025-05-25 18:54:56', 'Aguardando Triagem'),
(60, 79, '2025-05-25 18:57:11', 'Aguardando Triagem'),
(61, 79, '2025-05-25 18:57:21', 'Aguardando Triagem'),
(62, 79, '2025-05-25 18:57:23', 'Aguardando Triagem'),
(63, 79, '2025-05-25 18:58:05', 'Aguardando Triagem'),
(64, 79, '2025-05-25 18:58:55', 'Aguardando Triagem'),
(65, 79, '2025-05-25 18:59:38', 'Aguardando Triagem'),
(66, 77, '2025-05-25 19:01:35', 'Aguardando Triagem'),
(67, 77, '2025-05-25 19:04:53', 'Aguardando Triagem'),
(68, 77, '2025-05-25 19:04:58', 'Aguardando Triagem'),
(69, 79, '2025-05-25 19:20:50', 'Aguardando Triagem');

-- --------------------------------------------------------

--
-- Estrutura para tabela `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `senha` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `login`
--

INSERT INTO `login` (`id`, `email`, `senha`) VALUES
(7, 'a', 'a'),
(8, 'b', 'b'),
(9, 'h', 'h'),
(10, 'asdf', 'asdf');

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

CREATE TABLE `paciente` (
  `id` int(11) NOT NULL,
  `codigo` int(200) DEFAULT NULL,
  `nome` varchar(200) NOT NULL,
  `telefone` varchar(14) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `idade` int(2) NOT NULL,
  `idusuario` int(10) NOT NULL,
  `dataPaciente` date NOT NULL,
  `dataNascimento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `paciente`
--

INSERT INTO `paciente` (`id`, `codigo`, `nome`, `telefone`, `cpf`, `idade`, `idusuario`, `dataPaciente`, `dataNascimento`) VALUES
(77, NULL, 'Walyson da Costa Ferreira', '40028922', '079.848.524', 21, 7, '2025-05-25', '2003-05-25'),
(79, NULL, 'Evelyn Cosffer', '4002-8922', '123.123.123', 25, 7, '2025-05-25', '2025-07-25');

-- --------------------------------------------------------

--
-- Estrutura para tabela `triagem`
--

CREATE TABLE `triagem` (
  `id` int(11) NOT NULL,
  `idAtendimento` int(11) DEFAULT NULL,
  `pressao` varchar(50) DEFAULT NULL,
  `peso` decimal(4,2) DEFAULT NULL,
  `altura` decimal(4,2) DEFAULT NULL,
  `observacoes` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `triagem`
--

INSERT INTO `triagem` (`id`, `idAtendimento`, `pressao`, `peso`, `altura`, `observacoes`) VALUES
(1, 45, '22', 22.00, 22.00, 'NOWAYING'),
(2, 45, '22', 22.00, 22.00, 'NOWAYING'),
(8, 69, '12/8', 55.00, 1.60, 'EVEVEVEVEVVE');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `triagem`
--
ALTER TABLE `triagem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idAtendimento` (`idAtendimento`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atendimento`
--
ALTER TABLE `atendimento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de tabela `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT de tabela `triagem`
--
ALTER TABLE `triagem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `triagem`
--
ALTER TABLE `triagem`
  ADD CONSTRAINT `triagem_ibfk_1` FOREIGN KEY (`idAtendimento`) REFERENCES `atendimento` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
