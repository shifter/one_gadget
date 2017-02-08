require 'one_gadget/gadget'
require 'one_gadget/helper'
describe OneGadget::Gadget do
  before(:all) do
    @build_id = 'fake_id'
    OneGadget::Helper.color_off! # disable colorize for easy testing.
    OneGadget::Gadget.define(@build_id) do |g|
      g.offset = 0x1234
      g.constraints = ['[rsp+0x30]=NULL', 'rax=0']
    end
  end

  it 'inspect' do
    expect(OneGadget::Gadget.builds(@build_id).map(&:inspect).join).to eq <<-EOS
offset: 0x1234
constraints:
  [rsp+0x30]=NULL
  rax=0
    EOS
  end
end
