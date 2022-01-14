#include <ruby.h>

static VALUE
rescue_return_false(VALUE arg, VALUE e)
{
  return Qfalse;
}

static VALUE
try_callback(VALUE arg)
{
  rb_raise(rb_eStandardError, "Repro");
}

static VALUE
prot_callback(VALUE arg)
{
  return rb_rescue2(
    try_callback, arg,
    rescue_return_false, Qnil,
    rb_eRuntimeError, 0);
}

VALUE repro_call(VALUE self)
{
  int state;
  rb_protect(prot_callback, Qnil, &state);
  if (state) {
    rb_jump_tag(state);
  } else {
    return Qtrue;
  }
}

void
Init_repro()
{
    VALUE m_Repro = rb_define_module_under(rb_cObject, "Repro");
    rb_define_singleton_method(m_Repro, "call", repro_call, 0);
}
