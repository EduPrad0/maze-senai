package com.cel.shoppingquiosque.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cel.shoppingquiosque.dao.DaoCliente;
import com.cel.shoppingquiosque.model.Cliente;

@Controller
public class ClienteController {

	
	@RequestMapping("registrar")
	public String register() {
		return "cadastro";
	}
	
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save (Cliente cliente) {
		DaoCliente novoCliente = new DaoCliente();
		if(cliente.getId() == null) {
			System.out.println(cliente.getNome());
			System.out.println(cliente.getEmail());
			System.out.println(cliente.getEndereco());
			System.out.println(cliente.getIdade());
			System.out.println(cliente.getProdInte());
			System.out.println(cliente.getTelefone());
			System.out.println(cliente.isHomem());
			System.out.println(cliente.getDiaCadastro());
			
			cliente.setDiaCadastro(Calendar.getInstance().getTimeInMillis());
			
			novoCliente.criarCliente(cliente);
			
		}else {
			novoCliente.update(cliente);
			System.out.println(cliente.getId());
			return "redirect:admin/clientes";
		}
		
		System.out.println("Cliente criado");
		return "redirect:registrar";
	}
	
	
	@RequestMapping("admin/clientes")
	public String listagemClientes (Model model) {
		DaoCliente listarClientes = new DaoCliente();
		model.addAttribute("clientes", listarClientes.pegarClientes());
		return "tabela_cliente";
	}
	
	@RequestMapping("admin/delete_cliente")
	public String deletaClientes (Long idCliente) {
		DaoCliente deletaClientes = new DaoCliente();
		deletaClientes.delete(idCliente);
		return "redirect:clientes";
	}
	
	
	@RequestMapping("admin/dash")
	public String dashboardAdmin (Model model) {
		DaoCliente lista = new DaoCliente();
		List<Cliente> clientes = lista.pegarClientes();
		
		int mas = 0,fem = 0, jov = 0, adu = 0, ido = 0, man = 0, tar = 0, noi =0;
		int dom = 0, seg= 0, ter = 0, qua = 0, qui = 0, sex = 0, sab = 0;
		for (Cliente c: clientes) {
			
			if(c.isHomem()) {
				mas++;
			}else {
				fem++;
			}
			
			
			if(c.getIdade() < 19) {
				jov++;
			} else if (c.getIdade() < 61) {
				adu++;
			} else {
				ido++;
			}
			
			Calendar periodo = Calendar.getInstance();
			periodo.setTimeInMillis(c.getDiaCadastro());
			if(periodo.get(Calendar.HOUR_OF_DAY) < 12) {
				man++;
			} else if (periodo.get(Calendar.HOUR_OF_DAY) < 18) {
				tar++;
			} else {
				noi++;
			}
			
			
			switch (periodo.get(Calendar.DAY_OF_WEEK)) {
				case 1:
					dom++;
					break;
				case 2:
					seg++;
					break;
				case 3:
					ter++;
					break;
				case 4:
					qua++;
					break;
				case 5:
					qui++;
					break;
				case 6:
					sex++;
					break;
				default:
					sab++;
					break;
			}
			
		}
		
		model.addAttribute("mas", mas);
		model.addAttribute("fem", fem);
		
		model.addAttribute("jov", jov);
		model.addAttribute("adu", adu);
		model.addAttribute("ido", ido);
		
		model.addAttribute("man", man);
		model.addAttribute("tar", tar);
		model.addAttribute("noi", noi);
		
		model.addAttribute("dom", dom);
		model.addAttribute("seg", seg);
		model.addAttribute("ter", ter);
		model.addAttribute("qua", qua);
		model.addAttribute("qui", qui);
		model.addAttribute("sex", sex);
		model.addAttribute("sab", sab);
		return "dash";
	}

	
	
}	
