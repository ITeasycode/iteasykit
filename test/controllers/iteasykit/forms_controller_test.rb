require 'test_helper'

module Iteasykit
  class FormsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @form = iteasykit_forms(:one)
    end

    test "should get index" do
      get forms_url
      assert_response :success
    end

    test "should get new" do
      get new_form_url
      assert_response :success
    end

    test "should create form" do
      assert_difference('Form.count') do
        post forms_url, params: { form: { active: @form.active, calc: @form.calc, group: @form.group, iteasykit_entity_type_id: @form.iteasykit_entity_type_id, iteasykit_seomore_id: @form.iteasykit_seomore_id, machine_name: @form.machine_name, position: @form.position, slug: @form.slug, sticky: @form.sticky } }
      end

      assert_redirected_to form_url(Form.last)
    end

    test "should show form" do
      get form_url(@form)
      assert_response :success
    end

    test "should get edit" do
      get edit_form_url(@form)
      assert_response :success
    end

    test "should update form" do
      patch form_url(@form), params: { form: { active: @form.active, calc: @form.calc, group: @form.group, iteasykit_entity_type_id: @form.iteasykit_entity_type_id, iteasykit_seomore_id: @form.iteasykit_seomore_id, machine_name: @form.machine_name, position: @form.position, slug: @form.slug, sticky: @form.sticky } }
      assert_redirected_to form_url(@form)
    end

    test "should destroy form" do
      assert_difference('Form.count', -1) do
        delete form_url(@form)
      end

      assert_redirected_to forms_url
    end
  end
end
