module FilePicker

   	def FilePicker.open (entry)
			dialog =  Gtk::FileChooserDialog.new(:title => "Gtk::FileChooser sample", 
				:action => Gtk::FileChooserAction::OPEN,                                 
				:buttons => [[Gtk::Stock::OPEN, Gtk::ResponseType::ACCEPT],
										 [Gtk::Stock::CANCEL, Gtk::ResponseType::CANCEL]])
										 
			if dialog.run == Gtk::ResponseType::ACCEPT
				entry.set_text(dialog.filename)
			end
			dialog.destroy
    end
    
end