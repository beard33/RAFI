require "gtk3"
require "./Utils/Filepicker.rb"
require "./Utils/Application"

TITLE = 'Rafi'
ENTRY_TEXT = 'Please insert here a checksum to be compared'

win = Gtk::Window.new
win.set_resizable(false)
win.set_size_request(900, 500)
win.set_title(TITLE)
layout = Gtk::Layout.new

file_e = Gtk::Entry.new
file_e.set_text("File")
file_e.override_color(:normal, Application::GREY)
file_e.set_width_chars(64)
file_b = Gtk::Button.new(:label => "Select file")

Md5_e = Gtk::Entry.new
Md5_e.set_width_chars(64)
Md5_e.set_editable(false)
Md5_b = Gtk::CheckButton.new(" Md5")

s1_e = Gtk::Entry.new
s1_e.set_width_chars(64)
s1_e.set_editable(false)
s1_b = Gtk::CheckButton.new("sha1")

s256_e = Gtk::Entry.new
s256_e.set_width_chars(64)
s256_e.set_editable(false)
s256_b = Gtk::CheckButton.new(" sha256")

s512_e = Gtk::Entry.new
s512_e.set_width_chars(64)
s512_e.set_editable(false)
s512_b = Gtk::CheckButton.new(" sha512")

compute = Gtk::Button.new(:label => "Compute")
result = Gtk::Entry.new
result.set_width_chars(64)
label = Gtk::Label.new(ENTRY_TEXT)
label.mnemonic_widget = result

layout.put(file_b, 696, 40)
layout.put(file_e, 40 , 40)
layout.put(Md5_b, 40, 100 )
layout.put(Md5_e, 200, 100)
layout.put(s1_b, 40, 150)
layout.put(s1_e, 200, 150)
layout.put(s256_b, 40, 200)
layout.put(s256_e, 200, 200) 
layout.put(s512_b, 40, 250)
layout.put(s512_e, 200, 250)
layout.put(label, 200, 320)
layout.put(compute, 40, 350)
layout.put(result, 200, 350)
 
file_b.signal_connect("clicked") do
  FilePicker.open(file_e)
end

compute.signal_connect("clicked") do
  Md5_e.set_text('')
  s1_e.set_text('')
  s256_e.set_text('')
  s512_e.set_text('')
  res = result.text
  unless file_e.text.eql?('File')
    if Md5_b.active?
      Application.control_status(file_e.text, 'md5', Md5_e, res)
    end
    if s1_b.active?
      Application.control_status(file_e.text, 'sha1', s1_e, res)
    end
    if s256_b.active?
      Application.control_status(file_e.text, 'sha256', s256_e, res)
    end
    if s512_b.active?
      Application.control_status(file_e.text, 'sha512', s512_e, res)
    end
    
  end
end

win.add(layout)
win.signal_connect("destroy"){Gtk.main_quit}
win.show_all
puts result.text
Gtk.main