class UploadPhotoInput < SimpleForm::Inputs::Base

  def input
    template.tag(:input, :name => 'files[]', :type => 'file', :'data-url' => '/cpanel/images', :multiple => true, :class => 'fileupload')
  end
end
